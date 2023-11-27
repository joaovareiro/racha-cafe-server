class ChangeUserIdToStringInSubscriptions < ActiveRecord::Migration[7.1]
  def change
    change_column :subscriptions, :user_id, :string
  end
end
