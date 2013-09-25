class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :signed_request_data

  def signed_request_data
    @_signed_request_data = JSON.parse(base64_url_decode(params[:signed_request].split('.', 2)[1])) if params[:signed_request]
  end

  def base64_url_decode(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_','+/'))
  end

end