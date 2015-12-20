class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.text :profile
      t.integer :univ_id
      t.integer :grade
      t.string :username
      t.string :image

      t.timestamps null: false
    end
  end
end
