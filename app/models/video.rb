class Video < ActiveRecord::Base
  belongs_to :author, class_name:"User"
  validates :author_id, presence:true
  validates :url, uniqueness:true, presence:true
end
