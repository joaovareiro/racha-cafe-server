class AuthenticationController < ApplicationController
  include AuthenticationHelper

  before_action :authenticate_request, only: [:secured_action, :get_user_info]

  def authenticate
    username = params[:username]
    password = params[:password]
  
    access_token, refresh_token = retrieve_tokens(username, password)

    if access_token.present?
      render json: { access_token: access_token, refresh_token: refresh_token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def refresh_token
    refresh_token = params[:refresh_token]

    access_token = refresh_access_token(refresh_token)

    render json: { access_token: access_token }
  end

  def secured_action
    render json: { message: 'Secured action successful!' }
  end

  def get_user_info
    access_token = request.headers['Authorization']&.split(' ')&.last

    unless access_token.present?
      render json: { error: 'Access token is missing' }, status: :unauthorized
      return
    end

    user_info = validate_token_with_keycloak(access_token)
    render json: user_info
  end
end
