require 'spec_helper'

describe AppController do

  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'version'" do
    it "returns http success" do
      get 'version'
      response.should be_success
    end
  end

  describe "GET 'tour'" do
    it "returns http success" do
      get 'tour'
      response.should be_success
    end
  end

end
