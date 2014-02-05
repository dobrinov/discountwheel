class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_filter :set_p3p
  helper_method :signed_request_data

  def signed_request_data
    @_signed_request_data = JSON.parse(base64_url_decode(params[:signed_request].split('.', 2)[1])) if params[:signed_request]
  end

  def base64_url_decode(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_','+/'))
  end

  def user_likes_page?(user, page_id)
    facebook_likes_for(user).include?(page_id.to_s)    
  end

  def facebook_data_for(user)
    p = Proc.new do
      path = "/#{user.id}?oauth_token=#{user.oauth_token}"
      http = Net::HTTP.new('graph.facebook.com', 443)
      http.use_ssl = true
      res = http.get(path, nil)

      JSON.parse(res.body)
    end

    @_user_graph_data ||= p.call
  end

  def facebook_likes_for(user)
    logger.debug "USER: #{user}"
    path = "/#{user.id}?fields=likes&oauth_token=#{user.oauth_token}"
    http = Net::HTTP.new('graph.facebook.com', 443)
    http.use_ssl = true
    res = http.get(path, nil)

    data = JSON.parse(res.body)

    data['likes']['data'].map { |p| p['id'] }
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def logged_in?
    current_user.present?
  end

  def init_instance_variables
    @app_id     = '371914089608290'
    @page_name  = 'mania.pernik'
    @page_id    = '372485692804942'

    @callback_url        = URI.escape("https://discountwheel.herokuapp.com/callback")
    @page_tab_canvas_url = "https://www.facebook.com/pages/#{@page_name}/#{@page_id}?id=#{@page_id}&v=app_#{@app_id}"
    @scope               = 'email,user_likes'

    @auth_url = "https://www.facebook.com/dialog/oauth?client_id=#{@app_id}&redirect_uri=#{@callback_url}&scope=#{@scope}"
  end

  private

  def set_p3p
    headers['P3P'] = 'CP="IDC DSP COR CURa ADMa OUR IND PHY ONL COM STA"'
  end

end