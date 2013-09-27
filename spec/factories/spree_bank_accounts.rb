FactoryGirl.define do
  factory :spree_bank_account, class: "Spree::BankAccount" do
    bank_name { Faker::Company.name }
    bank_branch { Faker::Address.city }
    account_owner { Faker::Name.name }
    account_number { Faker.numerify("############") }
  end
end
