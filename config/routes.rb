Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :sub do
    resources :users
    resources :subscription_plans, path: 'plan'
    resources :subscriptions, path: 'subscription' do
      member do
        put 'cancel'
        put 'renew'
        get 'events'
      end
    end
  end
end
