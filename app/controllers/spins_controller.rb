class SpinsController < ApplicationController

  layout 'admin'

  def index
    if params[:code].present?
      @spins = DiscountWheelSpin.find(params[:code]) rescue []
      @no_results_message = 'No wheel spins with such code.'
    else
      @spins = DiscountWheelSpin.all
      @no_results_message = 'No pending winners.'
    end
  end

  def update
  end

  def destroy
    @spin = DiscountWheelSpin.find(params[:id])
    @spin.destroy
    redirect_to spins_path
  end
end