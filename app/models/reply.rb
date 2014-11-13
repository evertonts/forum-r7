class Reply < ActiveRecord::Base
  belongs_to :post
  
  validates :message, presence: true
end
