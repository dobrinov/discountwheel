class SpinsController < ApplicationController

  layout 'admin'

  def index
    @spins = DiscountWheelSpin.all
  end

  def search
    redirect_to spin_path(params[:code])
  end

  def show
  end

  def update
  end

  def destroy
    @spin = DiscountWheelSpin.find(params[:id])
    @spin.destroy
    redirect_to spins_path
  end
end