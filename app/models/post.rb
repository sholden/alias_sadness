class Post < ApplicationRecord
  self.table_name = 'posts_schema.posts'

  has_many :comments
end
