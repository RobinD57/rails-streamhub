class TwitchTransformService

  def initialize(params = {})
    @twitch_follow_details = params["data"]
  end


  def perform
    is_online?
    follow_attributes = @twitch_follow_details.map { |follow| build_result_hash(follow) }
    return follow_attributes
  end

  private

  def build_result_hash(follow)
      result_hash = {
        game_title: "PLACEHOLDER", # API call required? we only get game ID
        viewers: follow["viewer_count"],
        stream_title: follow["title"],
        streamer_name: follow["user_name"],
        thumbnail: follow["thumbnail_url"].gsub("{width}", "450").gsub("{height}", "300"),
        online_status: true
      }
  end

  def is_online?
    @twitch_follow_details.each do |follow|
      if follow["type"] == "live"
        build_result_hash(follow)
      end
    end
  end
end
