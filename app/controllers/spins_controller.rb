class SpinsController < ApplicationController
  def index
    @spins = DiscountWheelSpin.all
  end

  def destroy
    @spin = DiscountWheelSpin.find(params[:id])
    @spin.destroy
    redirect_to spins_path
  end
end