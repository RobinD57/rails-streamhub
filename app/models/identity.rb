class Identity < ApplicationRecord
  belongs_to :user
  has_many :follows, dependent: :destroy
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |identity|
      identity.refresh_token = auth.credentials["refresh_token"]
      identity.token = auth.credentials.token
    end
  end
end
