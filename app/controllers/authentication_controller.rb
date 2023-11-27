require 'uri'
require 'net/http'
require 'openssl'

class AuthenticationController < ApplicationController
  include AuthenticationHelper

  before_action :authenticate_request, only: [:secured_action]

  def authenticate
    username = params[:username]
    password = params[:password]
  
    access_token, refresh_token = retrieve_tokens(username, password)
  
    render json: { access_token: access_token, refresh_token: refresh_token }
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
    user_info = validate_token_with_keycloak(access_token)
    render json: user_info
  end

end