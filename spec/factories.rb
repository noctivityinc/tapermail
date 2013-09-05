require 'faker'

FactoryGirl.define do
  factory :greylist do
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end