class CreateSubscriptionEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :subscription_events do |t|
      t.string :name
      t.text :description
      t.integer :subscription_id
      t.string :event_type

      t.timestamps
    end
  end
end
