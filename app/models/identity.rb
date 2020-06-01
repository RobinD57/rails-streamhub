class Identity < ApplicationRecord
  belongs_to :user
  has_many :follows

  def self.create_from_provider_data(auth, user)
    where(provider: auth["provider"], uid: auth["uid"], user: user).first_or_create
  end
end
