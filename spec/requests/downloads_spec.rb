require 'spec_helper'

describe "Downloads" do
  describe "GET /downloads" do
    it "can render the show page with a valid download token" do
      download = FactoryGirl.create(:download)
      num_left = download.number_remaining

      get download_path(download.token)
      expect(response).to render_template(:show)

      download.reload
      expect(download.number_remaining).to eq(num_left - 1)
    end

    it "wont render the show page with an invalid token but redirect with flash to te homepage" do
      get download_path('asdfasdfasdf')
      expect(response).to redirect_to(root_path)

      flash[:error].should =~ /download link is not valid/i
    end

    it "renders the index page with flash if there are no more available downloads for a token" do
      download = FactoryGirl.create(:download, number_remaining: 0)

      get download_path(download.token)
      expect(response).to redirect_to(root_path)

      flash[:error].should =~ /download link has expired/i
    end

  end
end
