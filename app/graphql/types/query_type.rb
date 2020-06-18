module Types
  class QueryType < Types::BaseObject
    field :follows,
          [Types::FollowType],
          null: false,
          description: "Returns a list of all your follows"
    field :identities, [Types::IdentityType], null: false

    def follows
      current_user.identities.map { |identity| Follow.where(identity_id: identity.id) }.flatten
    end

    def identities
      current_user.identities
    end
  end
end
