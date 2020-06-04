class MixerTransformService

  def initialize(params = {})
    @mixer_follows = params
  end


  def perform
    @mixer_follows.map do |follow|
      build_result_hash(follow)
    end.reject { |h| h.nil? }
  end

  private

  def build_result_hash(follow)
    if follow["online"]
      result_hash = {
        game_title: follow["type"]["name"],
        viewers: follow["type"]["viewersCurrent"],
        stream_title: follow["name"],
        streamer_name: follow["token"],
        thumbnail: follow["bannerUrl"],
        online_status: true
      }
    end
  end
end
