class Post < ActiveRecord::Base
  hash_many :replies
end
