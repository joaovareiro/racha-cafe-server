require 'rails_helper'

RSpec.describe Sub::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sub/users').to route_to('sub/users#index')
    end

    it 'routes to #show' do
      expect(get: '/sub/users/1').to route_to('sub/users#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sub/users').to route_to('sub/users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sub/users/1').to route_to('sub/users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sub/users/1').to route_to('sub/users#update', id: '1')
    end

    it 'routes to #destroy' do 
      expect(delete: '/sub/users/1').to route_to('sub/users#destroy', id: '1')
    end
  end
end