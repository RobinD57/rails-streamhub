class MixerTransformService

  def initialize(params = {})
    @mixer_follows = params[:followers]
  end


  def perform
    results_hash = @mixer_follows.each { |follow| build_result_hash(follow) }
  end

  private

  def build_result_hash(follow)
    if follow["online"]
      result_hash = {
        game_name: follow["type"]["name"],
        stream_current_viewers: follow["type"]["viewersCurrent"],
        stream_display_name: follow["name"],
        stream_name: follow["token"],
        stream_thumbnail: follow["bannerUrl"], # 440x250 needed
        online_status: follow["online"]
      }
    end
  end
end
