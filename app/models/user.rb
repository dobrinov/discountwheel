class User < ActiveRecord::Base
  set_primary_key :id
  has_many :discount_wheel_spins
end