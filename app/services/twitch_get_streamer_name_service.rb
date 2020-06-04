class TwitchGetStreamerNameService
  def initialize(params = {})
    @identity = params[:identity]
    @game_id = params[:game_id]
  end

  def perform
    url = "https://api.twitch.tv/helix/games?id=#{@game_id}"
    game_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    JSON.parse(game_serialized)["data"].map { |data| data["name"] }.join
  end
end
