require 'json'
require 'rest-client'
require 'net/http'
require 'uri'

class MixerRefreshAccessTokenService

	def initialize(params = {})
		@mixer_refresh_token = params[:refresh_token]
	end

	def perform
		uri = URI.parse("https://mixer.com/api/v1/oauth/token")
		request = Net::HTTP::Post.new(uri)
		request.set_form_data(
				"client_id" => ENV['MIXER_APP_ID'],
				"client_secret" => ENV['MIXER_APP_SECRET'],
				"grant_type" => "refresh_token",
				"refresh_token" => "#{@mixer_refresh_token}"
				)

		req_options = {
				use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
			http.request(request)
		end
		jsonrespone = JSON.parse(response.body)
		return jsonrespone
	end
end

# curl -d "grant_type=refresh_token&refresh_token=&client_id=&client_secret=" https://mixer.com/api/v1/oauth/token

# r = MixerRefreshAccessTokenService.new
# p r.perform
