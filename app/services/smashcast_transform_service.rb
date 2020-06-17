class SmashcastTransformService

  def initialize(params = {})
    @final_live_details = params
  end

  def perform
    @final_live_details.map! do |follow|
      build_result_hash(follow["livestream"].first)
    end.reject { |h| h.nil? }
  end

  private

  def build_result_hash(follow)
    if follow["channel"]["media_is_live"] == "1"
      url = "http://edge.sf.hitbox.tv/"
      result_hash = {
        game_title: follow["category_name"],
        box_art: url << follow["category_logo_large"], #gsub("{width}", "285").gsub("{height}", "380"),
        viewers: follow["media_views"],
        stream_title: follow["media_status"],
        streamer_name: follow["media_name"],
        thumbnail: url << follow["media_thumbnail"], #.gsub("{width}", "450").gsub("{height}", "300"),
        avatar: url << follow["channel"]["user_logo_small"],
        online_status: true
      }
    end
  end
end
