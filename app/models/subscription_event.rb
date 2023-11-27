class SubscriptionEvent < ApplicationRecord
  belongs_to :subscription

  validates :name, presence: true
  validates :description, presence: true
  validates :event_type, presence: true
end
