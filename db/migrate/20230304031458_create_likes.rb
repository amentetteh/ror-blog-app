class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
