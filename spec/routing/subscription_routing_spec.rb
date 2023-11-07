require 'rails_helper'

RSpec.describe Sub::SubscriptionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sub/subscription').to route_to('sub/subscriptions#index')
    end

    it 'routes to #show' do
      expect(get: '/sub/subscription/1').to route_to('sub/subscriptions#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sub/subscription').to route_to('sub/subscriptions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sub/subscription/1').to route_to('sub/subscriptions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sub/subscription/1').to route_to('sub/subscriptions#update', id: '1')
    end

    it 'routes to #destroy' do 
      expect(delete: '/sub/subscription/1').to route_to('sub/subscriptions#destroy', id: '1')
    end

    it 'routes to #create_with_inactive_status' do
      expect(post: '/sub/subscription/create_with_inactive_status').to route_to('sub/subscriptions#create_with_inactive_status')
    end

    it 'routes to #cancel' do
      expect(put: '/sub/subscription/1/cancel').to route_to('sub/subscriptions#cancel', id: '1')
    end

    it 'routes to #renew' do
      expect(put: '/sub/subscription/1/renew').to route_to('sub/subscriptions#renew', id: '1')
    end
  end
end