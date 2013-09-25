class WheelController < ApplicationController

  def index
  end

  def spin
    @power = rand(360)

    respond_to do |format|
      format.js
    end
  end

end