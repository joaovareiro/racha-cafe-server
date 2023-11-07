class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :payment_status
      t.date :expiration_date, default: nil 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
