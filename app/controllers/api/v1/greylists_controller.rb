class Api::V1::GreylistsController < ApplicationController
  respond_to :json

  def index
    respond_with Greylist.all
  end
end
