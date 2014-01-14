class SpinsController < ApplicationController
  def index
    @spins = DiscountWheelSpin.all
  end

  def destroy
    @spin = DiscountWheelSpin.find(params[:id])
    @spin.destroy
    redirect_to winn3rs_path
  end
end