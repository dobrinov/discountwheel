class User < ActiveRecord::Base
  has_many :discount_wheel_spins
end