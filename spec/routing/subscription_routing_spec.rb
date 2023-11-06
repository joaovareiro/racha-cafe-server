require 'rails_helper'

RSpec.describe SubscriptionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sub').to route_to('subscriptions#index')
    end

    it 'routes to #show' do
      expect(get: '/sub/1').to route_to('subscriptions#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sub').to route_to('subscriptions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sub/1').to route_to('subscriptions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sub/1').to route_to('subscriptions#update', id: '1')
    end

    it 'routes to #destroy' do 
      expect(delete: '/sub/1').to route_to('subscriptions#destroy', id: '1')
    end

    it 'routes to #create_with_inactive_status' do
      expect(post: '/sub/create_with_inactive_status').to route_to('subscriptions#create_with_inactive_status')
    end

    it 'routes to #cancel' do
      expect(put: '/sub/1/cancel').to route_to('subscriptions#cancel', id: '1')
    end

    it 'routes to #renew' do
      expect(put: '/sub/1/renew').to route_to('subscriptions#renew', id: '1')
    end
  end
end