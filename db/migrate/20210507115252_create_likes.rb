class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :likes
      t.references :post, index: true, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
