class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :friend_1, index: true, foreign_key: {to_table: :users}
      t.references :friend_2, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
