class SpinsController < ApplicationController

  layout 'admin'

  def index
    if params[:code].present?
      @pending_winnings = DiscountWheelSpin.find(params[:code]) rescue []
      @no_results_message = 'No winnings with such code.'
    else
      @pending_winnings = DiscountWheelSpin.where(given: false)
      @no_results_message = 'No pending winners.'
    end

    @given_winnings = DiscountWheelSpin.where(given: true)
  end

  def update
    spin = DiscountWheelSpin.find(params[:id])
    spin.give!

    redirect_to spins_path
  end

  def reset
    DiscountWheelSpin.destroy_all
    redirect_to spins_path
  end

  def destroy
    @spin = DiscountWheelSpin.find(params[:id])
    @spin.destroy
    redirect_to spins_path
  end
end