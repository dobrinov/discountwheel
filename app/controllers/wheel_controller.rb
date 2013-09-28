class WheelController < ApplicationController

  helper_method :prize_for, :text_for

  before_filter :init_instance_variables

  before_filter do
    @likes_page = user_likes_page?(current_user, @page_id)
  end

  def index
  end

  def spin
    @angle = 2 * 360 + ((rand(360) / 15).floor * 15)

    respond_to do |format|
      format.js
    end
  end

  def already_played
  end

  private

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

end