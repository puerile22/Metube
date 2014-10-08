class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  validates :comment, presence:true
end
