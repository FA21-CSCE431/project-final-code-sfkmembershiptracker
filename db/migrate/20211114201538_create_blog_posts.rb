class CreateBlogPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.string :position
      t.string :message

      t.timestamps
    end
  end
end
