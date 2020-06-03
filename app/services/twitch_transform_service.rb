class TwitchTransformService

  def initialize(params = {})
    @twitch_follow_details = params[:follow_details]
  end


  def perform
    @twitch_follow_details.each { |follow| build_result_hash(follow) }
  end

  private

  def build_result_hash(follow)
    result_hash = {
      game_name: follow["type"]["name"],
      stream_current_viewers: follow["type"]["viewersCurrent"],
      stream_display_name: follow["name"],
      stream_name: follow["token"],
      stream_thumbnail: follow["bannerUrl"],
      online_status: follow["online"]
    }
  end
end
