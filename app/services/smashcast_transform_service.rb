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
      url = "http://edge.sf.hitbox.tv"
      result_hash = {
        game_title: follow["category_name"],
        box_art: follow["category_logo_large"].nil? ? nil : url + follow["category_logo_large"], #gsub("{width}", "285").gsub("{height}", "380"),
        viewers: follow["media_views"],
        stream_title: follow["media_status"],
        streamer_name: follow["media_name"],
        thumbnail: follow["media_thumbnail"].nil? ? nil : url + follow["media_thumbnail"], #.gsub("{width}", "450").gsub("{height}", "300"),
        avatar: follow["channel"]["user_logo_small"].nil? ? nil : url + follow["channel"]["user_logo_small"],
        online_status: true
      }
    end
  end
end
