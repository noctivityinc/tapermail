class AppController < ApplicationController
  def help
  end

  def version
    render json: {version: '1.0.17', url: 'http://tapermail.com/app/taper1017.zip'}
  end

  def tour
    render layout: 'blank'
  end
end
