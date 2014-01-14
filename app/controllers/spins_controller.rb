class SpinsController < ApplicationController
  def index
    @spins = DiscountWheel.all
  end

  def destroy
    @spin = DiscountWheel.find(params[:id])
    @spin.destroy
    redirect_to winn3rs_path
  end
end