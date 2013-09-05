require 'spec_helper'

describe "Api::V1::Greylists" do
  describe "GET /api/greylists" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get api_greylists_path
      response.status.should be(200)
    end

    it "gets a valid list of greylisted sites" do
      entry = FactoryGirl.create(:greylist)
      1.upto(5) { FactoryGirl.create(:greylist) }

      get( 'api/greylists' )

      resp = JSON.parse(response.body)
      resp.class.should eq Array
      resp.detect {|x| x["id"] == entry.id}.should be_true
    end
  end
end
