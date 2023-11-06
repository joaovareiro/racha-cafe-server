require 'rails_helper'

RSpec.describe Subscription, type: :model do
    it 'should create a new subscription' do
        s = Subscription.new(
            user_id: 1,
            tuition_category: 'string',
            payment_status: 'inactive',
            expiration_date: Date.today
        )
        s.save

        expect(s.id).not_to be_nil
  end
end