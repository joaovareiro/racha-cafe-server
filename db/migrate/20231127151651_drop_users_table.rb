class DropUsersTable < ActiveRecord::Migration[7.1]
  def up
    remove_foreign_key :subscriptions, :users if foreign_key_exists?(:subscriptions, :users)
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
