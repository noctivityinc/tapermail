class WelcomeController < ApplicationController
  def index
  end

  def feedback
    redirect_to 'http://taper.uservoice.com'
  end
end
