require 'json'
require 'rest-client'
require 'net/http'
require 'uri'

class TwitchRefreshAccessTokenService

  def initialize(params = {})
    @twitch_refresh_token = params[:refresh_token]
  end

  def perform
    uri = URI.parse("https://id.twitch.tv/oauth2/token")
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
        "client_id" => ENV['TWITCH_APP_ID'],
        "client_secret" => ENV['TWITCH_APP_SECRET'],
        "grant_type" => "refresh_token",
        "refresh_token" => "#{@twitch_refresh_token}",
        )

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    jsonrespone = JSON.parse(response.body)
    jsonrespone['access_token']
  end
end
