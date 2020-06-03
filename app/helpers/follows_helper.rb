module FollowsHelper
  def has_provider?(user, provider)
    user.identities.map do |identity|
      identity.provider
    end.include?(provider)
  end
end
