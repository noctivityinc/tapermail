# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_version do
    version_file Rack::Test::UploadedFile.new('spec/factories/images/spacer.gif', 'image/png')
    version_type 'standard'
    sequence(:version_number) {|n| "1.0.#{n}" }
  end
end
