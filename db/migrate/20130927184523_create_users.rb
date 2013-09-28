class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :surname
      t.string   :email
      t.string   :gender
      t.string   :oauth_token
      t.datetime :oauth_token_issued_at
      t.datetime :oauth_token_expires_at

      t.timestamps
    end
  end
end
