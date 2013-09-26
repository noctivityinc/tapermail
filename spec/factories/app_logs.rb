# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email_domain do |n|
    "domain_#{n}.com"
  end

  factory :app_log do
    uuid { SecureRandom.hex }
    email_domain
  end
end
