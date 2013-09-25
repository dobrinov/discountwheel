class WheelController < ApplicationController

  def index
    app_id   = '371914089608290'
    auth_url = 'https://discountwheel.herokuapp.com/'
    scope    = 'email' 

    if signed_request_data['user_id'].nil?
      redirect_to "https://www.facebook.com/dialog/oauth?client_id=#{app_id}&redirect_uri=#{auth_url}&scope=#{scope}"
    else
    end
  end

  def spin
    @power = rand(360)

    respond_to do |format|
      format.js
    end
  end

end