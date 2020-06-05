class TwitchTransformService

  def initialize(params = {})
    @identity = params[:identity]
    @twitch_follow_details = params[:follow_details]["data"]
  end


  def perform
    @twitch_follow_details.map do |follow|
      build_result_hash(follow)
    end.reject { |h| h.nil? }
  end

  private

  def build_result_hash(follow)
    if follow["type"] == "live"
      game_title_and_box_art = TwitchGetStreamerNameService.new(game_id: follow["game_id"], identity: @identity).perform
      result_hash = {
        game_title: game_title_and_box_art[:game_title],
        box_art: game_title_and_box_art[:box_art].gsub("{width}", "285").gsub("{height}", "380"),
        viewers: follow["viewer_count"],
        stream_title: follow["title"],
        streamer_name: follow["user_name"],
        thumbnail: follow["thumbnail_url"].gsub("{width}", "450").gsub("{height}", "300"),
        avatar: TwitchGetUserAvatarService.new(user_id: follow["user_id"], identity: @identity).perform,
        online_status: true
      }
    end
  end
end
