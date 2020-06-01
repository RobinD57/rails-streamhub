class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(twitch mixer)
  has_many :identities
  # validates :username, presence: true

  def self.from_omniauth(auth)
    user = where(email: auth["email"]).first_or_create do |user|
      user.email = auth.info["email"]
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info["name"]
    end # block for pre-filling rest of user creation infromation
    Identity.create_from_provider_data(auth, user)
  end

  def self.new_with_session(params, session) # need to make it work for all sign ups
    super.tap do |user|
      if data = session["devise.twitch_data"] && session["devise.twitch_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
