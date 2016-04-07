class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :number_to_like, limit:8
      t.integer :like_it, limit: 1

      t.timestamps null: false
    end
  end
end
