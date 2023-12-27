# frozen_string_literal: true

# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   skip_before_action :verify_authenticity_token, only: [:facebook]

#   def facebook
#     Rails.logger.info("Facebook OmniAuth callback initiated...")
#     @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       Rails.logger.info("User signed in successfully with Facebook.")
#       # callback_url = "#{request.protocol}#{request.host_with_port}/users/auth/facebook/callback"
#       sign_in_and_redirect @user, event: :authentication, :event => :authentication, :location => 'https://boatbnb-623630f4ace7.herokuapp.com/users/auth/facebook/callback'
#       set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
#     else
#       Rails.logger.error("Failed to sign in with Facebook.")
#       session["devise.facebook_data"] = request.env["omniauth.auth"]
#       redirect_to new_user_registration_url
#     end
#   end

#   def failure
#     Rails.logger.error("Facebook authentication failed.")
#     redirect_to root_path
#   end
# end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = request.env['omniauth.auth']
    @user = User.from_omniauth(auth)

    if @user.nil?
      flash[:error] = 'Failed to authenticate via Google.'
      redirect_to root_path
    elsif @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'Failed to authenticate via Google.'
      redirect_to root_path
    end
  end
end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
