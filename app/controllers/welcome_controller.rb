class WelcomeController < ApplicationController
  def index
  end

  def feedback
    redirect_to 'https://moot.it/taper'
  end
end
