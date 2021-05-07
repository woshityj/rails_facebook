class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
