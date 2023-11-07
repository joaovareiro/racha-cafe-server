class SubscriptionPlan < ApplicationRecord

  has_many :subscriptions

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
