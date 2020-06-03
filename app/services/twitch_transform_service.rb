class TwitchTransformService

  def initialize(params = {})
    @twitch_follow_details = params.twitch_follows
  end


  def perform
    is_online?
    follow_attributes = @twitch_follow_details.map { |follow| build_result_hash(follow) }
    return follow_attributes
  end

  private

  def build_result_hash(follow)
      result_hash = {
        game_name: "PLACEHOLDER", # API call required? we only get game ID
        stream_current_viewers: follow[:viewer_count],
        stream_display_name: follow[:user_name],
        stream_name: follow[:title],
        stream_thumbnail: follow[:thumbnail_url].gsub("{width}", "450").gsub("{height}", "300"),
        online_status: true # follow[:type] == "live" ? true : false
      }
  end

  def is_online?
    @twitch_follow_details["data"].each do |follow|
      if follow["type"] == "live"
        build_result_hash(follow)
      end
    end
  end
end
