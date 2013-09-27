# == Schema Information
#
# Table name: app_versions
#
#  id                        :integer          not null, primary key
#  version_file_file_name    :string(255)
#  version_file_content_type :string(255)
#  version_file_file_size    :integer
#  version_file_updated_at   :datetime
#  change_log                :text
#  version_type              :string(255)
#  version_number            :string(255)
#  active                    :boolean
#  created_at                :datetime
#  updated_at                :datetime
#

require 'spec_helper'

describe AppVersion do

  it "should have a working factory" do
    FactoryGirl.build(:app_version).should be_valid
  end

  it "should not create a record without a file" do
    FactoryGirl.build(:app_version, version_file: nil).should_not be_valid
  end

  it "should not create a record without a version number" do
    FactoryGirl.build(:app_version, version_number: nil).should_not be_valid
  end

  it "should not create a record without a version type" do
    FactoryGirl.build(:app_version, version_type: nil).should_not be_valid
  end

  it "should obfiscate the file name" do
    v1 = FactoryGirl.create(:app_version, version_type: 'standard', active: true)

    expect(v1.version_file.url).to_not include(v1.version_file_file_name)
  end

  it "should let us find a single standard version" do
    v1 = FactoryGirl.create(:app_version, version_type: 'standard', active: true)
    v2 = FactoryGirl.create(:app_version, version_type: 'pro', active: true)

    expect(AppVersion.standard).to eql v1
  end

  it "should let us find a single standard version" do
    v1 = FactoryGirl.create(:app_version, version_type: 'standard', active: true)
    v2 = FactoryGirl.create(:app_version, version_type: 'pro', active: true)

    expect(AppVersion.pro).to eql v2
  end

  it "should only allow one active version for each version type" do
    v1 = FactoryGirl.create(:app_version, version_type: 'standard', active: true)
    expect(AppVersion.standard).to eql v1

    v2 = FactoryGirl.create(:app_version, version_type: 'standard', active: true)

    v1.reload

    expect(v1).to_not eql v2
    expect(AppVersion.standard).to eql v2
    expect(v1.active).to_not be_true
  end



end
