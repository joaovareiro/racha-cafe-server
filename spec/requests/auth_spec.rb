require 'swagger_helper'

RSpec.describe 'Authentication API', type: :request do
  path '/authenticate' do
    post('Authenticate user') do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_credentials, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: ['username', 'password']
      }

      response '200', 'successful' do
        let(:user_credentials) {
          {
            username: 'example_user',
            password: 'example_password'
          }
        }

        run_test!
      end
    end
  end

  path '/refresh_token' do
    post('Refresh access token') do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :refresh_token, in: :body, schema: {
        type: :object,
        properties: {
          refresh_token: { type: :string }
        },
        required: ['refresh_token']
      }

      response '200', 'successful' do
        let(:refresh_token) { { refresh_token: 'example_refresh_token' } }

        run_test!
      end
    end
  end

  path '/get_user_info' do
    get('Get user information') do
      parameter name: :Authorization, in: :header, type: :string, required: true
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'

      response '200', 'successful' do
        let(:Authorization) { 'Bearer YOUR_ACCESS_TOKEN' } # Replace with a valid access token

        run_test!
      end
    end
  end
end