class WheelController < ApplicationController

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

end