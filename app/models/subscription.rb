class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription_plan
  has_many :subscription_events, dependent: :destroy

  validates :payment_status, presence: true
  validates :expiration_date, presence: true

  validates_uniqueness_of :user_id
end
