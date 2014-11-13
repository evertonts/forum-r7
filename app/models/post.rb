class Post < ActiveRecord::Base
  has_many :posts
  
  validates :message, presence: true
end
