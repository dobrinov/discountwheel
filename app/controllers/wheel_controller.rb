class WheelController < ApplicationController

  def index
  end

  def spin
    @angle = (1..2).to_a.sample * 360 + ((rand(360) / 15).floor * 15)

    respond_to do |format|
      format.js
    end
  end

end