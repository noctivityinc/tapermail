class AppController < ApplicationController
  def help
  end

  def version
    render json: {version: '1.0.22', url: 'https://s3.amazonaws.com/Taper/TaperPro.app.1.0.22.zip'}
  end

  def tour
    render layout: 'blank'
  end
end
