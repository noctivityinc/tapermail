# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "someone_#{n}"
  end

  factory :download do
    name 
    token { SecureRandom.hex }
  end
end
