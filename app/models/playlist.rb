class Playlist < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  has_many :lists
  has_many :videos, through: :lists
end
