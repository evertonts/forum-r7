class Post < ActiveRecord::Base
  has_many :replies, class_name: 'Post'
  
  validates :message, presence: true
  
  scope :thread, -> { where(post_id: nil) }
end
