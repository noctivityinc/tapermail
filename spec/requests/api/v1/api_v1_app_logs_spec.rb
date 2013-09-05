require 'spec_helper'

describe "Api::V1::AppLogs" do

  before(:all) do
    @auth_header = { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(ENV['taper_api_key']) }
  end

  describe "GET /api/app_logs" do
    it "does not allow access without an API key" do
      get (api_app_logs_path)
      response.status.should be(401)
    end

    it "does not allow access without the correct API key" do
      bad_auth_header = { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(SecureRandom.hex) }

      get('/api/app_logs', nil, bad_auth_header)

      response.status.should be(401)
    end

    it "does not allow access without the correct API key" do
      get('/api/app_logs', nil, @auth_header)

      response.status.should be(200)
    end
  end

  describe "POST /api/app_logs" do
    before(:each) do
      @data = {
        uuid: SecureRandom.hex,
        email_domain: 'testdomain.com'
      }
    end

    it "should allow for the record to be logged" do
      post('/api/app_logs', {app_log: @data}, @auth_header)

      response.status.should be(201)

      resp = JSON.parse(response.body)
      resp['id'].should_not be_blank
    end

    it "should not allow for the record to be logged without a header" do
      post('/api/app_logs', {app_log: @data})

      response.status.should be(401)
    end

    it "should not allow for the record to be logged without a UUID" do
      post('/api/app_logs', {app_log: {
        email_domain: 'testdomain.com'
        }}, @auth_header)

      response.status.should be(400)
    end    

    it "should not allow for the record to be logged without an email domain" do
      post('/api/app_logs', {app_log: {
        uuid: SecureRandom.hex
        }}, @auth_header)

      response.status.should be(400)
    end
  end

  describe "GET /api/app_logs/:uuid" do
    it "should get all the results for that uuid" do
      uuid = SecureRandom.hex
      5.times { FactoryGirl.create(:app_log, uuid: uuid)}

      get( "/api/app_logs/#{uuid}", nil, @auth_header)

      response.status.should be(200)

      resp = JSON.parse(response.body)
      resp.select {|x| x['uuid'] == uuid}.count.should eq 5
    end

    it "should return a 404 if no results can be found" do
      uuid = SecureRandom.hex
      get( "/api/app_logs/#{uuid}", nil, @auth_header)

      response.status.should be(404)
    end

    it "should return a 401 with an auth header" do
      uuid = SecureRandom.hex
      get( "/api/app_logs/#{uuid}", nil)

      response.status.should be(401)
    end
  end

end
