require 'json'
require 'rest-client'
require 'net/http'
require 'uri'

class RefreshTwitchAccessTokenService

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
# curl -d "grant_type=refresh_token&refresh_token=p66qi0p1wd1ay14gf9884tp0eploqcvcvg6dn10bhx637j17qz&client_id=77vqrdbqf7hjl2ddf9dvff501e2izj&client_secret=ucdhv4lz3gx0rntfn8v476djbs34le" https://id.twitch.tv/oauth2/token
# r = RefreshTwitchAccessTokenService.new(refresh_token: 'quopnd68ftirfc946jbxf26lljadrggvutjnfhlbldqhtt4qi7')
# p r.perform()
