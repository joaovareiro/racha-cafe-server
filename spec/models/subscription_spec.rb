require 'rails_helper'

RSpec.describe Subscription, type: :model do
    it 'should create a new subscription' do
        sp = SubscriptionPlan.new(
            name: 'string',
            description: 'string',
            price: 'string'
        )
        sp.save
        s = Subscription.new(
            user_id: 1,
            subscription_plan_id: sp.id,
            payment_status: 'inactive',
            expiration_date: Date.today
        )
        s.save
        expect(s.id).not_to be_nil
    end
end