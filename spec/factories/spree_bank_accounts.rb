FactoryGirl.define do
  factory :spree_bank_account, class: "Spree::BankAccount" do
    bank_name
    bank_branch    { Faker::Address.city }
    account_owner { generate(:name) }
    account_number
  end
end
