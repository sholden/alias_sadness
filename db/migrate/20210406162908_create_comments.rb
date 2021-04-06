class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_schema 'comments_schema'

    create_table 'comments_schema.comments' do |t|
      t.belongs_to :post, null: false, foreign_key: { to_table: 'posts_schema.posts' }
      t.string :body
      t.boolean :deleted, default: false, null: false

      t.timestamps
    end
  end
end
