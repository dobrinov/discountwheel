class User < ActiveRecord::Base
  attr_accessible :name, :surname, :email, :gender, :oauth_token, :oauth_token_issued_at, :oauth_token_expires_at
end