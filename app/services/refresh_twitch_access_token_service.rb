require 'json'
require 'rest-client'
require 'net/http'
require 'uri'

class RefreshTwitchAccessTokenService

  def initialize(params = {})
    @twitch_refresh_token = params[:refresh_token]
    # @identity = params[:identity]
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
    # jsonrespone = JSON.parse(response.body)
    # jsonrespone['refresh_token']
    # response.code
    # response.body
  end

  # def perform
  #   url = "https://id.twitch.tv/oauth2/token"
  #   client_id = ENV['TWITCH_APP_ID']
  #   client_secret = ENV['TWITCH_APP_SECRET']
  #   refresh_token = @twitch_refresh_token
  #   grant_type = 'refresh_token'
  #
  #   request = "#{url}?grant_type=#{grant_type}&refresh_token=#{refresh_token}&client_id=#{client_id}&client_secretd=#{client_secret}"
  #
  #   refresh_action = open(request).read
  #   JSON.parse(refresh_action)
  #
  # end
  #

end
# r = RefreshTwitchAccessTokenService.new(refresh_token: 'p66qi0p1wd1ay14gf9884tp0eploqcvcvg6dn10bhx637j17qz')
# p r.perform()
# curl -d "grant_type=refresh_token&refresh_token=p66qi0p1wd1ay14gf9884tp0eploqcvcvg6dn10bhx637j17qz&client_id=77vqrdbqf7hjl2ddf9dvff501e2izj&client_secret=ucdhv4lz3gx0rntfn8v476djbs34le" https://id.twitch.tv/oauth2/token


