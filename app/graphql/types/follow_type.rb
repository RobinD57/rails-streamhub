module Types
  class FollowType < Types::BaseObject
    field :id, ID, null: false
    field :identity_id, Integer, null: false
    field :online_status, Boolean, null: true
    field :thumbnail, String, null: true
    field :streamer_name, String, null: true
    field :stream_title, String, null: true
    field :viewers, Integer, null: true
    field :game_title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :box_art, String, null: true
    field :avatar, String, null: true
  end
end
