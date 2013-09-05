class AppController < ApplicationController
  def help
  end

  def version
    render text: '1.0.17'
  end

  def tour
  end
end
