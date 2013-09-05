class Api::V1::AppLogsController < ApplicationController
  prepend_before_filter :restrict_access

  skip_before_filter  :verify_authenticity_token, only: [:create]

  respond_to :json

  def index
    respond_with AppLog.all
  end

  def create
    @app_log = AppLog.new(app_log_params)

    respond_to do |wants|
      wants.json {
        if @app_log.save
          render json: @app_log, status: 201
        else
          render json: nil, status: 400
        end
      }
    end
  end

  def show
    @app_logs = AppLog.where(uuid: params[:id]).order(:created_at)

    respond_to do |wants|
      wants.json {
        if @app_logs.present?
          render json: @app_logs, status: 200
        else
          render json: nil, status: 404
        end
      }
    end
  end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      token == ENV['taper_api_key']
    end
  end


  private

  def app_log_params
    params.permit(:uuid, :email_domain)
  end

end
