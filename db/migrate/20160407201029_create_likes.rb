class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :number_to_like, limit:8, null: false
      t.integer :like_it, limit: 1, null: false

      t.timestamps null: false
    end
  end
end
