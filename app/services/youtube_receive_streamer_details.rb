class YoutubeReceiveStreamerDetailsService

  def initialize(params = {})
    @identity = params[:identity]
    @twitch_follows = params[:followers]["data"]
  end


end
