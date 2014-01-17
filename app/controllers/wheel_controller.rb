class WheelController < ApplicationController

  helper_method :prize_for, :text_for, :code_for

  before_filter :init_instance_variables

  before_filter do
    raise "FOKIN USER ID #{current_user}"
    @likes_page = user_likes_page?(current_user, @page_id)
  end

  before_filter :verify_allowed_to_spin, except: [:already_played]

  def terms
  end

  def index
  end

  def spin
    @angle = 2 * 360 + ((rand(360) / 15).floor * 15)
    @prize = prize_for(@angle)
    @spin  = DiscountWheelSpin.new({ prize: @prize })

    current_user.discount_wheel_spins << @spin
    current_user.save

    respond_to do |format|
      format.js
    end
  end

  def already_played
  end

  private

  def verify_allowed_to_spin
    redirect_to wheel_already_played_path if current_user.discount_wheel_spins.any?
  end

  def prize_for(angle)
    wheel_sectors = [ 20, 15, 25, 30, 20, 15, 100, 15, 20, 30, 25, 15, 20, 15, 20, 25, 20, 15, 25, 15, 20, 25, 20, 15 ]

    wheel_sectors[((angle - 720) / 15).round]
  end

  def text_for(prize)
    if(prize == 100)
      'безплатна дреха'
    else
      "#{prize}% отстъпка"
    end
  end

  def code_for(spin)
    "2008#{spin.id}"
  end

end