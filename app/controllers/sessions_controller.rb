class SessionsController < ApplicationController

  def create
    @app_id     = '371914089608290'
    @page_name  = 'Dobrinovs-lab'
    @page_id    = '747088781984697'

    # https://developers.facebook.com/docs/reference/dialogs/oauth/
    # https://developers.facebook.com/docs/appsonfacebook/pagetabs/
    @canvas_url = URI.escape("https://discountwheel.herokuapp.com/callback")
    @scope      = 'email'

    @auth_url = "https://www.facebook.com/dialog/oauth?client_id=#{@app_id}&redirect_uri=#{@canvas_url}&scope=#{@scope}"
  end

  def index
  end

end