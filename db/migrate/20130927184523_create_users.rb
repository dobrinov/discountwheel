class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :surname
      t.string   :email
      t.string   :hometown
      t.string   :location
      t.string   :gender
      t.string   :oauth_tocken
      t.datetime :oauth_tocken_issued_at
      t.datetime :oauth_tocken_expires_at

      t.timestamps
    end
  end
end
