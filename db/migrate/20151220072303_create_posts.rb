class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :reply_id
      t.string :image
      t.string :movie

      t.timestamps null: false
    end
  end
end
