require 'spec_helper'

describe Spree::BankAccount do
  before(:each) { create(:spree_bank_account) }

  it "be createable" do
    expect {
      create(:spree_bank_account)
    }.to change(Spree::BankAccount, :count)
  end

  it "be updateable" do
    bank_account = create(:spree_bank_account)
    bank_account.account_owner  = "Kiesha"
    bank_account.account_number = 1234567890
    bank_account.should be_valid

    expect {
      bank_account.save
    }.to_not change(Spree::BankAccount, :count)

    bank_account.reload
    bank_account.account_owner.should eq "Kiesha"
    bank_account.account_number.should eq 1234567890
  end

  it "be removeable" do
    bank_account = Spree::BankAccount.first
    bank_account.destroy.should be_true
    expect {
      bank_account.reload
    }.to raise_error(ActiveRecord::RecordNotFound)
  end

  context "creating" do
    context "with valid data" do
      it "should be successfull" do
        attrs = attributes_for(:spree_bank_account)
        bank_account = Spree::BankAccount.new attrs
        expect {
          bank_account.save
        }.to change(Spree::BankAccount, :count)
      end
    end

    context "with existed bank account" do
      it "should be failed" do
        company = generate(:company)
        acc_num = generate(:random_number)

        expect {
          create(:spree_bank_account, bank_name: company, account_number: acc_num)
        }.to change(Spree::BankAccount, :count)

        bank_account = build(:spree_bank_account, bank_name: company, account_number: acc_num)
        bank_account.should_not be_valid
        bank_account.save.should be_false
        bank_account.errors[:account_number].should include bank_account.
                     errors.generate_message(:account_number, :taken)
      end
    end

    context "with invalid account number" do
      it "should be failed" do
        attrs = attributes_for(:spree_bank_account, account_number: "abcd")
        bank_account = Spree::BankAccount.new attrs
        bank_account.should_not be_valid
        bank_account.save.should be_false
        bank_account.errors[:account_number].should include bank_account.
                     errors.generate_message(:account_number, :not_a_number)
      end
    end
  end

  context ".active" do
    it "should list active bank account" do
      create_list(:spree_bank_account, 5)
      active_acc   = create_list(:spree_bank_account, 3, active: true)

      bank_accounts = Spree::BankAccount.active
      bank_accounts.count.should eq 3
      bank_accounts.should eq active_acc
    end
  end
end
