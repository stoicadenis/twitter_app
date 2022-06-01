class NewRepliesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :message
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end

    add_index :replies, :user_id
    add_index :replies, :post_id
  end
end
