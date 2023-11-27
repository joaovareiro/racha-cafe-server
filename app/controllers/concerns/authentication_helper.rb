require 'net/http'

module AuthenticationHelper
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  private

  def authenticate_request
    access_token = request.headers['Authorization']&.split(' ')&.last
    user_info = validate_token_with_keycloak(access_token)
    head :unauthorized unless user_info
  end
  

  def make_keycloak_request(url, method, headers = {}, body = nil)
    uri = URI(url)
  
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = method == :post ? Net::HTTP::Post.new(uri) : Net::HTTP::Get.new(uri)
    request["Content-Type"] = 'application/x-www-form-urlencoded' if method == :post
    headers.each { |key, value| request[key] = value }
    request.body = body if body

    response = http.request(request)
    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  end

  def retrieve_tokens(username, password)
    keycloak_url = 'https://auth.facoffee.hsborges.dev/realms/facoffee/protocol/openid-connect/token'
    headers = { "Content-Type" => 'application/x-www-form-urlencoded' }
    body = "client_id=facoffee&grant_type=password&username=#{username}&password=#{password}&scope=openid"
  
    response = make_keycloak_request(keycloak_url, :post, headers, body)
    
    if response
      if response['error'].present?
        Rails.logger.error("Keycloak error: #{response['error_description']}")
        return nil, nil
      else
        access_token = response['access_token']
        refresh_token = response['refresh_token']
        return access_token, refresh_token
      end
    else
      Rails.logger.error("Keycloak request failed. Response: #{response.inspect}")
      return nil, nil
    end
  end
  
  def retrieve_access_token(username, password)
    access_token, _ = retrieve_tokens(username, password)
    access_token
  end
  

  def refresh_access_token(refresh_token)
    keycloak_url = 'https://auth.facoffee.hsborges.dev/realms/facoffee/protocol/openid-connect/token'
    headers = { "Content-Type" => 'application/x-www-form-urlencoded' }
    body = "client_id=facoffee&grant_type=refresh_token&refresh_token=#{refresh_token}"

    make_keycloak_request(keycloak_url, :post, headers, body)['access_token']
  end

  def validate_token_with_keycloak(access_token)
    keycloak_url = 'https://auth.facoffee.hsborges.dev/realms/facoffee/protocol/openid-connect/userinfo'
    headers = { "User-Agent" => 'insomnia/8.3.0', "Authorization" => "Bearer #{access_token}" }
    make_keycloak_request(keycloak_url, :get, headers)
  end
end