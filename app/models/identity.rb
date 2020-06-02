class Identity < ApplicationRecord
  belongs_to :user
  has_many :follows
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end

#   def self.create_from_provider_data(auth, user)
#    where(provider: auth["provider"], uid: auth["uid"], user: user).first_or_create
#  end
