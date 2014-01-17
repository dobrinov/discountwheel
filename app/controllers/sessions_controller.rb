require "net/http"

class SessionsController < ApplicationController

  before_filter :init_instance_variables

  def index
  end

  def create
    unless signed_request_data.nil? || signed_request_data['user_id'].nil?

      user = User.where(id: signed_request_data['user_id']).first_or_create

      # Update user data
      user.oauth_token            = signed_request_data['oauth_token']
      user.oauth_token_issued_at  = DateTime.strptime(signed_request_data['issued_at'].to_s,'%s')
      user.oauth_token_expires_at = DateTime.strptime(signed_request_data['expires'].to_s,'%s')

      user.name    = facebook_data_for(user)['first_name']
      user.surname = facebook_data_for(user)['last_name']
      user.email   = facebook_data_for(user)['email']
      user.gender  = facebook_data_for(user)['gender']

      user.save

      # Create session
      session[:current_user_id] = user.id

      raise "#{session[:current_user_id]} --- #{user.id}"

      redirect_to wheel_path
    end
  end

end