class AddPostIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :post, foreign_key: {to_table: :posts}
  end
end
