class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(twitch mixer)
  has_many :identities
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  # validates :username, presence: true

    def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.create(
          username: auth.info["name"] || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end


=begin
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
=end
# above is old code for now!
