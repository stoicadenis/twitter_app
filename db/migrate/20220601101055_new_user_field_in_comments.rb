class NewUserFieldInComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user
    add_foreign_key :comments, :users
  end
end
