class SessionsController < ApplicationController

  before_filter :init_instance_variables

  def create
  end

  def index
  end

  private

  def init_instance_variables
    @app_id     = '371914089608290'
    @page_name  = 'Dobrinovs-lab'
    @page_id    = '747088781984697'

    @callback_url        = URI.escape("https://discountwheel.herokuapp.com/callback")
    @page_tab_canvas_url = "https://www.facebook.com/pages/#{@page_name}/#{@page_id}?id=#{@page_id}&v=app_#{@app_id}"
    @scope               = 'email'

    @auth_url = "https://www.facebook.com/dialog/oauth?client_id=#{@app_id}&redirect_uri=#{@callback_url}&scope=#{@scope}"
  end

end