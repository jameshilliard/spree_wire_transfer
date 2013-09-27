require 'spec_helper'

describe Spree::BankAccount do
  before :each do
    expect { create(:spree_bank_account) }.to change(Spree::BankAccount, :count)
  end


  context "creating" do
    context "with valid data" do
      it "should be successfull" do
        bank_account = Spree::BankAccount.new attributes_for(:spree_bank_account)
        expect { bank_account.save }.to change(Spree::BankAccount, :count)
      end
    end
    context "with invalid account number" do
      it "should be failed" do
        bank_account = Spree::BankAccount.new attributes_for(:spree_bank_account).merge(account_number: "not-numerify-string")
        expect(bank_account).to_not be_valid
        bank_account.save.should be_false
      end
    end
  end
end
