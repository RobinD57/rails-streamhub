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
				# "client_id" => ENV['MIXER_APP_ID'],
				"client_id" => '5f4e22b900900568c243538ff7ab78a048f299728084992b',
				# "client_secret" => ENV['MIXER_APP_SECRET'],
				"client_secret" => '1c62a3ae9ac2e99cf8672642c9f1824526b6ca9a2fbb8cee14ef5cdd8cdf5c56',
				"grant_type" => "refresh_token",
				# "refresh_token" => "LqHHW9aBIjn7P0LBoigiPv2AVXYMQ9qqxcaX9rQ0P5mu1IipsqvITUOxCDEuT2K2"
				"refresh_token" => "#{@mixer_refresh_token}"
				)

		req_options = {
				use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
			http.request(request)
		end
		jsonrespone = JSON.parse(response.body)
			# return jsonrespone['access_token'], jsonrespone['refresh_token']
		return jsonrespone
	end
end

# curl -d "grant_type=refresh_token&refresh_token=DBTgoz75nLtfI2MT0blfthCgq2P96yhoOSbGK8YC7PSboe2bkRVSdBnuTqPcLuI7&client_id=5f4e22b900900568c243538ff7ab78a048f299728084992b&client_secret=1c62a3ae9ac2e99cf8672642c9f1824526b6ca9a2fbb8cee14ef5cdd8cdf5c56" https://mixer.com/api/v1/oauth/token

r = MixerRefreshAccessTokenService.new
p r.perform
