class WheelController < ApplicationController

  def index
    @app_id     = '371914089608290'
    @page_name  = 'Dobrinovs-lab'
    @canvas_url = URI.escape("https://www.facebook.com/#{@page_name}/#{@app_id}")
    @scope      = 'email'

    @auth_url = "https://www.facebook.com/dialog/oauth?client_id=#{@app_id}&redirect_uri=#{@canvas_url}&scope=#{@scope}"
  end

  def spin
    @power = rand(360)

    respond_to do |format|
      format.js
    end
  end

end