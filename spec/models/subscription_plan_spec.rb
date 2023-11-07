require 'rails_helper'

RSpec.describe SubscriptionPlan, type: :model do
  
  it 'should create a new subscription plan' do
    s = SubscriptionPlan.new(
      name: 'string',
      description: 'string',
      price: 'string'
    )
    s.save
    expect(s.id).not_to be_nil
  end
end