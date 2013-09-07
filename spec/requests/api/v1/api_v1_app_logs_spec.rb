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
      post('/api/app_logs', @data, @auth_header)
      response.status.should be(201)

      resp = JSON.parse(response.body).first
      resp['id'].should_not be_blank
    end

    it "should properly record bytes in and out" do
      @data.merge!({bytes_sent: 922337203685477580, bytes_recv: 922337203685477590})
      post('/api/app_logs', @data, @auth_header)

      response.status.should be(201)

      resp = JSON.parse(response.body).first
      resp['id'].should_not be_blank
      resp['bytes_sent'].should eq 922337203685477580
      resp['bytes_recv'].should eq 922337203685477590
    end

    it 'should properly store multiple email domains if passed' do
      @data.merge!({email_domain: 'testdomain1.com, testdomain2.com,testdomain3.com'})
      post('/api/app_logs', @data, @auth_header)

      response.status.should be(201)

      resp = JSON.parse(response.body)
      resp.size.should eq 3
      resp.detect {|x| x['email_domain'] == 'testdomain1.com'}.should be_true
      resp.detect {|x| x['email_domain'] == 'testdomain2.com'}.should be_true
      resp.detect {|x| x['email_domain'] == 'testdomain3.com'}.should be_true
    end

    it "should not allow for the record to be logged without a header" do
      post('/api/app_logs', @data)

      response.status.should be(401)
    end

    it "should not allow for the record to be logged without a UUID" do
      post('/api/app_logs', { email_domain: 'testdomain.com' }, @auth_header)

      response.status.should be(400)
    end    

    it "should not allow for the record to be logged without an email domain" do
      post('/api/app_logs', { uuid: SecureRandom.hex }, @auth_header)

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
