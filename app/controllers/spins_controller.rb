class SpinsController < ApplicationController
  def index
  end

  def search
    match = /2008(\d+)/.match(params[:code])

    if match.size > 1
      @spin = DiscountWheelSpin.find(match[1])
      redirect_to spin_path(@spin)
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