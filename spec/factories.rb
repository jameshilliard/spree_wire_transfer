# used to regiester sequences
FactoryGirl.define do
  sequence :company, aliases: [:bank_name] do
    Faker::Company.name
  end

  sequence :name, aliases: [:account_name] do
    Faker::Name.name
  end

  sequence :random_number, aliases: [:account_number] do
    Faker.numerify("##########")
  end
end
