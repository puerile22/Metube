class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :videos, foreign_key:"author_id"
  has_many :playlists, foreign_key:"user_id"
  has_many :comments
  # validates :email, uniqueness:true,presence:true
end
