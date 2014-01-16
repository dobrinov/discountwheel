class DiscountWheelSpin < ActiveRecord::Base
  belongs_to :user

  def give!
    self.given = true
    self.save!
  end

end