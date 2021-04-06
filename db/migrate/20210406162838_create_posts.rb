class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_schema 'posts_schema'

    create_table 'posts_schema.posts' do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
