class Subscription < ApplicationRecord
  belongs_to :user

  validates :tuition_category, presence: true
  validates :payment_status, presence: true
  validates :expiration_date, presence: true

  validates_uniqueness_of :user_id
end
