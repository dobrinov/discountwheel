class CreateDiscountWheelSpins < ActiveRecord::Migration
  def change
    create_table :discount_wheel_spins do |t|
      t.string :prize
      t.integer :user_id
      t.boolean :given, default: false

      t.timestamps
    end
  end
end
