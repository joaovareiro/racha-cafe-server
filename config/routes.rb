Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :subscriptions, path: 'sub' do
    post 'create_with_inactive_status', on: :collection
    put 'cancel', on: :member
    put 'renew', on: :member
  end
  
end
