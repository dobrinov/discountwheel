class WheelController < ApplicationController

  def index
  end

  def spin
    @angle = (2..5).to_a.sample * 360 + rand(360)

    respond_to do |format|
      format.js
    end
  end

end