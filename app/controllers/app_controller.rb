class AppController < ApplicationController
  def help
  end

  def version
    render json: {taper: {version: '1.0.26', url: 'https://s3.amazonaws.com/Taper/Taper.app.1.0.26.zip'}, taperpro: {version: '1.0.26', url: 'https://s3.amazonaws.com/Taper/TaperPro.app.1.0.26.zip'}}
  end

  def tour
    render layout: 'blank'
  end

  def help
    redirect_to 'http://taper.uservoice.com/knowledgebase'
  end
end
