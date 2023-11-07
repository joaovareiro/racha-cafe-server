class AddSubscriptionPlanToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :subscriptions, :subscription_plan, null: false, foreign_key: true
  end
end
