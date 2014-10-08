class User < ActiveRecord::Base
  has_many :videos, foreign_key:"author_id"
  has_many :playlists, foreign_key:"user_id"
  has_secure_password
  validates :email, uniqueness:true,presence:true
end
