class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(twitch mixer)
  has_many :identities
  validates :username, presence: true

  def self.create_with_omniauth(info)
    create(name: info['name'])
  end
end
