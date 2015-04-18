class AddUsersToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users

    # add_column :comments, :user_id, :integer
    # add_index :comments, :user_id
    # add_foreign_key :comments, :users
  end
end
