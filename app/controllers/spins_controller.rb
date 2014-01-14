class SpinsController < ApplicationController
  def index
  end

  def search
    matches = /2008(\d+)/.match(params[:code].to_s)
    if matches.present?
      @spin = DiscountWheelSpin.find(matches[1])
      render 'show'
    else
      redirect_to spins_path, notice: 'No results.'
    end

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