require "spec_helper"

describe DownloadsController do
  describe "routing" do

    it "does not route without a token" do
      get("/dl").should_not be_routable
    end

  end
end
