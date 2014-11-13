class Post < ActiveRecord::Base
  has_many :replies, class_name: 'Post'
  
  validates :message, presence: true
  
  before_save :sanitize_message
  
  scope :thread, -> { where(post_id: nil) }
  
  def sanitize_message
    ::ProfanityFilter.instance.sanitize!(message)
  end
end
