class TwitchTransformService

  def initialize(params = {})
    @twitch_follow_details = params["data"]
  end


  def perform
    @twitch_follow_details.map do |follow|
      build_result_hash(follow)
    end.reject { |h| h.nil? }
  end

  private

  def build_result_hash(follow)
    if follow["type"] == "live"
      result_hash = {
        game_title: "PLACEHOLDER", # API call required? we only get game ID
        viewers: follow["viewer_count"],
        stream_title: follow["title"],
        streamer_name: follow["user_name"],
        thumbnail: follow["thumbnail_url"].gsub("{width}", "450").gsub("{height}", "300"),
        online_status: true
      }
    end
  end
end
