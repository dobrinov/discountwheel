class WheelController < ApplicationController

  def index
    @app_id     = '371914089608290'
    @canvas_url = 'https://discountwheel.herokuapp.com/'
    @scope      = 'email'

    @auth_url = "https://www.facebook.com/dialog/oauth?client_id=#{@app_id}&redirect_uri=#{Base64.encode64(@canvas_url)}&scope=#{@scope}"
  end

  def spin
    @power = rand(360)

    respond_to do |format|
      format.js
    end
  end

end