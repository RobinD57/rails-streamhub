module Types
  class IdentityType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :provider, String, null: true
    field :uid, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :token, String, null: true
    field :refresh_token, String, null: true
    field :follows, [Types::FollowType], null: false, description: "Returns a list of all your follows"
  end
end
