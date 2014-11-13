class Post < ActiveRecord::Base
  has_many :posts
  
  validates :message, presence: true
  
  scope :thread, -> { where(post_id: nil) }
end
