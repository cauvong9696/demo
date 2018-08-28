class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  validates_presence_of :user
end
