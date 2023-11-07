require 'swagger_helper'

RSpec.describe 'subscription_plans', type: :request do

  path '/sub/plan' do
    post('create subscription plan') do
      tags 'SubscriptionPlans'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :new_subscription_plan, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer }
        }
      }

        response(201, 'successful') do
          let(:new_subscription_plan) {{
            name: 'string',
            description: 'string',
            price: 100
          }}

          example 'application/json', :example, {
            "id": 1,
            "name": "string",
            "description": "string",
            "price": 100,
            "created_at": "2023-11-05T23:13:39.989Z",
            "updated_at": "2023-11-05T23:13:39.989Z",
          }
          run_test!
        end
      end
    

    get('list subscription plans') do
      tags 'SubscriptionPlans'
      produces 'application/json'
      response(200, 'successful') do
        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "description": "string",
          "price": 100,
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
      }
        run_test!
      end
    end
  end


  path '/sub/plan/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show subscription plan') do
      tags 'SubscriptionPlans'
      produces 'application/json'
      response(200, 'successful') do
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:id) { subscription_plan.id }
        example 'application/json', :example, {
          "id": 1,
          "name": "string",
          "description": "string",
          "price": 100,
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
  
  

    patch('update subscription plan') do
      tags 'SubscriptionPlans'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :new_subscription_plan, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer }
        }
      }

      response(200, 'successful') do

        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:id) { subscription_plan.id }
        let(:new_subscription_plan) {{
          name: 'new string',
        }}
        example 'application/json', :example, {
          "id": 1,
          "name": "new string",
          "description": "string",
          "price": 100,
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end

    put('update subscription plan') do
      tags 'SubscriptionPlans'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :new_subscription_plan, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer }
        }
      }
      response(200, 'successful') do
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:id) { subscription_plan.id }
        let(:new_subscription_plan) {{
          name: 'new string',
          description: 'new string',
          price: 100
        }}
        example 'application/json', :example, {
          "id": 1,
          "name": "new string",
          "description": "string",
          "price": 100,
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
    


    delete('delete subscription plan') do
      tags 'SubscriptionPlans'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      produces 'application/json'

      response(204, 'successful') do
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:id) { subscription_plan.id }
        
      end
    end
  end
end