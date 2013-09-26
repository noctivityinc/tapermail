# == Schema Information
#
# Table name: downloads
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  name             :string(255)
#  token            :string(255)
#  last_download_at :datetime
#  number_remaining :integer          default(5)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Download do
  
  it "should generate a token when creating a record" do
    download = FactoryGirl.create(:download)

    expect(download.token).not_to be_blank
  end

  it "should not generate a token when saving if one exists" do
    download = FactoryGirl.create(:download, token: 'spectest')

    download.name = 'something new'
    download.save

    download.reload
    expect(download.token).to  eql('spectest')
  end

  it "should not allow a token with a spec" do
    FactoryGirl.build(:download, token: 'spec test').should_not be_valid
  end

  it "should not allow duplicate tokens" do
    d1 = FactoryGirl.create(:download)
    FactoryGirl.build(:download, token: d1.token).should_not be_valid
  end
end
