class UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :find_for_oauth ]
    # render json
    # user.authentication_token

  def find_for_oauth(auth, signed_in_resource = nil)
    @identity = Identity.find_for_oauth(auth)
    @user = signed_in_resource ? signed_in_resource : identity.user
    if @user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      @user = User.where(:email => email).first if email
      if @user.nil?
        @user = User.create(
          username: auth.info["name"] || auth.uid,
          email: email ? email : auth.info["email"],
          password: Devise.friendly_token[0,20]
        )
      end
    end
    if @identity.user != @user
      @identity.user = @user
      @identity.save!
    end
    render json: { user: @user }
  end
end
