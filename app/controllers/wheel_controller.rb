class WheelController < ApplicationController

  def index
  end

  def spin
    @power = rand(360)

    @signed_request = Base64.decode64(params[:signed_request])

    respond_to do |format|
      format.js
    end
  end

end