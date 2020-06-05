class TwitchGetUserAvatarService
  def initialize(params = {})
    @identity = params[:identity]
    @user_id = params[:user_id]
  end

  def perform
    url = "https://api.twitch.tv/helix/users?id=#{@user_id}"
    user_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    JSON.parse(user_serialized)["data"].map { |data| data["profile_image_url"] }.join
  end
end
