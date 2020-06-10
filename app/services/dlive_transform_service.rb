class DliveTransformService
  def initialize(params = {})
    @dlive_follows = params
  end


  def perform
    test = @dlive_follows.map do |follow|
      build_result_hash(follow)
    end.reject { |h| h.nil? }
    binding.pry
  end

  private

  def build_result_hash(follow)
    if follow["livestream"]
      result_hash = {
        game_title: follow["livestream"]["category"]["title"],
        viewers: follow["livestream"]["watchingCount"],
        stream_title: follow["livestream"]["title"],
        streamer_name: follow["displayname"],
        thumbnail: follow["livestream"]["thumbnailUrl"],
        avatar: follow["avatar"],
        box_art: follow["livestream"]["category"]["imgUrl"],
        online_status: true
      }
    end
  end
end
