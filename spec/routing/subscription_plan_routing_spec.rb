require 'rails_helper'

RSpec.describe Sub::SubscriptionPlansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sub/plan').to route_to('sub/subscription_plans#index')
    end

    it 'routes to #show' do
      expect(get: '/sub/plan/1').to route_to('sub/subscription_plans#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sub/plan').to route_to('sub/subscription_plans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sub/plan/1').to route_to('sub/subscription_plans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sub/plan/1').to route_to('sub/subscription_plans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/sub/plan/1').to route_to('sub/subscription_plans#destroy', id: '1')
    end
  end
end