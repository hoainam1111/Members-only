class ChangeUserIdToReferencesInPosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :user_id, :integer
    add_reference :posts, :user, foreign_key: true
  end
end
