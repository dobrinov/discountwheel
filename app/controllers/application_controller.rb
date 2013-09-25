class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :base64_url_decode

   def base64_url_decode(str)
     str += '=' * (4 - str.length.modulo(4))
     Base64.decode64(str.tr('-_','+/'))
   end
end
