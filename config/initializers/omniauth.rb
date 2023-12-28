Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '855151387406-rcltjaleu6tkj1or5k6fr271ljo3vjkl.apps.googleusercontent.com', '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', {
    scope: 'email',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50,
    redirect_uri: Rails.env.production? ? 'https://boatbnb-623630f4ace7.herokuapp.com/users/auth/google_oauth2/callback' : 'https://96a4-194-230-158-149.ngrok-free.app/users/auth/google_oauth2/callback'
  }
end
