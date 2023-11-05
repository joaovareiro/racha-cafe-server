require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/users' do

    get('list users') do
      tags 'Users'
      produces 'application/json'

      response(200, 'successful') do
        example 'application/json', :example, [
          {
            "id": 1,
            "name": "string",
            "email": "string",
            "password": nil,
            "siape_code": "string",
            "role": "string",
            "created_at": "2023-11-05T23:13:39.989Z",
            "updated_at": "2023-11-05T23:13:39.989Z",
            "password_digest": "$2a$12$NPfxfVgQFpgcOSsojl.Kj.koRZAtCykhdIepZdPCALBe3/X6RtlNq"
          }
        ]
        run_test!
      end
    end

    post('create user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :new_user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          siape_code: { type: :string },
          role: { type: :string }
        }
      }

      response(201, 'successful') do
        let(:new_user) {{
          name: 'User 1',
          email: 'user@email.com',
          password: 'password',
          siape_code: '1234567',
          role: 'user'
        }}

        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "email": "string",
          "password": nil,
          "siape_code": "string",
          "role": "string",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
          "password_digest": "$2a$12$NPfxfVgQFpgcOSsojl.Kj.koRZAtCykhdIepZdPCALBe3/X6RtlNq"
        }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      tags 'Users'
      produces 'application/json'
      response(200, 'successful') do
        User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user')

        let(:id) { '1' }

        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "email": "string",
          "password": nil,
          "siape_code": "string",
          "role": "string",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
          "password_digest": "$2a$12$NPfxfVgQFpgcOSsojl.Kj.koRZAtCykhdIepZdPCALBe3/X6RtlNq"
        }
        run_test!
      end
    end

    patch('update user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :new_user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          siape_code: { type: :string },
          role: { type: :string }
        }
      }
      response(200, 'successful') do
        User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user')
        let(:id) { '1' }
        let(:new_user) {{name: 'User 1 modified'}}
        
        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "email": "string",
          "password": nil,
          "siape_code": "string",
          "role": "string",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
          "password_digest": "$2a$12$NPfxfVgQFpgcOSsojl.Kj.koRZAtCykhdIepZdPCALBe3/X6RtlNq"
        }
        run_test!
      end
    end

    put('update user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :new_user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          siape_code: { type: :string },
          role: { type: :string }
        }
      }

      response(200, 'successful') do
        tags 'Users'
        User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user')
        let(:id) { '1' }
        let(:new_user) {{name: 'User 1 modified', email: 'user_modified@email.com',password: 'password_modified', siape_code: '1234568',role: 'admin'}}

        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "email": "string",
          "password": nil,
          "siape_code": "string",
          "role": "string",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
          "password_digest": "$2a$12$NPfxfVgQFpgcOSsojl.Kj.koRZAtCykhdIepZdPCALBe3/X6RtlNq"
        }
        run_test!
      end
    end

    delete('delete user') do
      tags 'Users'
      produces 'application/json'
      response(204, 'successful') do
        let(:id) { '1' }
        run_test!
      end
    end
  end
end
