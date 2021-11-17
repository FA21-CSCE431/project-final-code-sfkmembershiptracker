def set_omniauth(opts = {})
    default = {
        :uid     => "102204533502419280226",
        :email => "sfk.website.431@gmail.com",
        :full_name => "Sports For Kids Admin",
        :avatar_url => "https://lh3.googleusercontent.com/a/AATXAJzAzbh_7qALHCCDG8iqnA1b0hikmOKL7TmsIhOP=s96-c"
    }

    credentials = default.merge(opts)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider => "google_oauth2",
        :uid => credentials[:uid],
        :info => {
          :name => credentials[:full_name],
          :email => credentials[:email],
          :avatar_url => credentials[:avatar_url]
        },
        :credentials => {
          :token => "token",
          :refresh_token => "refresh token"
        }
      }
    )
end

def set_invalid_omniauth()
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
end