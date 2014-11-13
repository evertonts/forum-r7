class Post < ActiveRecord::Base
  has_many :replies
  
  validates :message, presence: true
end
