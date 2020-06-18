module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    def current_user
      context[:current_user]
    end
  end
end
