class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :group_id, index: true, foreign_key: true, null: false
      t.integer :user_id,  index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
