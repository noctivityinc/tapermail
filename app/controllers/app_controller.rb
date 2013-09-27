class AppController < ApplicationController
  def help
  end

  def version
    std = AppVersion.standard
    pro = AppVersion.pro

    std_hash = std ? {version: std.version_number, url: std.version_file.url} : {}
    pro_hash = pro ? {version: pro.version_number, url: pro.version_file.url} : {}

    render json: {taper: std_hash, taperpro: pro_hash}
  end

  def tour
    render layout: 'blank'
  end

  def help
    redirect_to 'http://taper.uservoice.com/knowledgebase'
  end
end
