class WheelController < ApplicationController

  def index
  end

  def spin
    @angle = (2..5).to_a.sample * 360 + ((rand(360) / 15).floor * 15)

    respond_to do |format|
      format.js
    end
  end

end