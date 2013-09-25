class WheelController < ApplicationController

  def index
    @app_id   = '371914089608290'
    @auth_url = 'https://discountwheel.herokuapp.com/'
    @scope    = 'email' 
  end

  def spin
    @power = rand(360)

    respond_to do |format|
      format.js
    end
  end

end