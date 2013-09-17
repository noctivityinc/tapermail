class AppController < ApplicationController
  def help
  end

  def version
    render json: {taper: {version: '1.0.24', url: 'https://s3.amazonaws.com/Taper/Taper.app.1.0.24.zip'}, taperpro: {version: '1.0.24', url: 'https://s3.amazonaws.com/Taper/TaperPro.app.1.0.24.zip'}}
  end

  def tour
    render layout: 'blank'
  end
end
