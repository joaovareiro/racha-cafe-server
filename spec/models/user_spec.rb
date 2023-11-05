require 'rails_helper'

RSpec.describe User, type: :model do
    it 'should create a new user' do
      u = User.new(
        name: 'Test User',
        email: 'user@email.com',
        password: 'password',
        siape_code: '1234567',
        role: 'user'
      )
      u.save

      expect(u.id).not_to be_nil
    end
  
end
