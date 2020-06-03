class TwitchReceiveStreamerDetailsService

  def initialize(params = {})
    @twitch_follows = params[:followers]
  end


  def perform
    results_hash = @twitch_follows.each { |follow| build_result_hash(follow) }
  end
end
