class Comment < ApplicationRecord
  self.table_name = 'comments_schema.comments'

  belongs_to :post

  def self.default_scope
    where(deleted: false)
  end
end
