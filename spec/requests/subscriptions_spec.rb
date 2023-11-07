require 'swagger_helper'

RSpec.describe 'subscriptions', type: :request do

  path '/sub/subscription/create_with_inactive_status' do

    post('create_with_inactive_status subscription') do
      tags 'Subscriptions'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :new_subscription, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          subscription_plan_id: { type: :integer },
        }
      }

      response(201, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:new_subscription) {{
          user_id: user.id,
          subscription_plan_id: subscription_plan.id,
          payment_status: 'inactive',
          expiration_date: Date.today
        }}

        example 'application/json', :example, {
          "id": 1,
          "user_id": 1,
          "tuition_category": "string",
          "payment_status": "inactive",
          "expiration_date": "2023-11-05T23:13:39.989Z",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
  end

  path '/sub/subscription/{id}/cancel' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    put('cancel subscription') do
      tags 'Subscriptions'

      response(200, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }

        example 'application/json', :example, {
          "message": "Subscription cancelled successfully"
        }
        run_test!
      end
    end
  end

  path '/sub/subscription/{id}/renew' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    put('renew subscription') do
      tags 'Subscriptions'

      response(200, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }

        example 'application/json', :example, {
          "message": "Subscription renewed successfully"
        }
        run_test!
      end
    end
  end


  path '/sub/subscription' do

    get('list subscriptions') do
      tags 'Subscriptions'
      produces 'application/json'
      response(200, 'successful') do
        example 'application/json', :example, [{
          "id": 1,
          "user_id": 1,
          "subscription_plan_id": "integer",
          "payment_status": "inactive",
          "expiration_date": "2023-11-05T23:13:39.989Z",
          "created_at": "2023-11-05T23:13:39.989Z",
          }
        ]
        run_test!
      end
    end

  path '/sub/subscription/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show subscription') do
      tags 'Subscriptions'
      produces 'application/json'
      response(200, 'successful') do
        description 'Returns a subscription'

        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }
        example 'application/json', :example, {
          "id": 1,
          "user_id": 1,
          "subscription_plan_id": "integer",
          "payment_status": "inactive",
          "expiration_date": "2023-11-05T23:13:39.989Z",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
  end

  path '/sub/subscription/{id}' do
    patch('update subscription') do
      tags 'Subscriptions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the subscription to update'
      parameter name: :new_subscription, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          subscription_plan_id: { type: :integer },
          payment_status: { type: :string },
          expiration_date: { type: :date }
        }
      }

      response(200, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }
        let(:new_subscription) {{
          payment_status: 'active',
        }}

        example 'application/json', :example, {
          "id": 1,
          "user_id": 1,
          "subscription_plan_id": "integer",
          "payment_status": "inactive",
          "expiration_date": "2023-11-05T23:13:39.989Z",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
  end

  path '/sub/subscription/{id}' do
    put('update subscription') do
      tags 'Subscriptions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the subscription to update'
      parameter name: :new_subscription, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          subscription_plan_id: { type: :integer },
          payment_status: { type: :string },
          expiration_date: { type: :date }
        }
      }

      response(200, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }
        let(:new_subscription) {{
          payment_status: 'active',
          subscription_plan_id: subscription_plan.id
        }}

        example 'application/json', :example, {
          "id": 1,
          "user_id": 1,
          "subscription_plan_id": "integer",
          "payment_status": "inactive",
          "expiration_date": "2023-11-05T23:13:39.989Z",
          "created_at": "2023-11-05T23:13:39.989Z",
          "updated_at": "2023-11-05T23:13:39.989Z",
        }
        run_test!
      end
    end
  end

  path '/sub/subscription/{id}' do
    delete('delete subscription') do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      tags 'Subscriptions'
      produces 'application/json'
      response(204, 'successful') do
        let(:user) { User.create!(name: 'User 1', email: 'user@email.com',password: 'password', siape_code: '1234567',role: 'user') }
        let(:subscription_plan) { SubscriptionPlan.create!(name: 'string', description: 'string', price: 100) }
        let(:subscription) { Subscription.create!(user_id: user.id, subscription_plan_id:  subscription_plan.id, payment_status: 'inactive', expiration_date: Date.today) }
        let(:id) { subscription.id }
        run_test!
      end
    end
  end
end
end