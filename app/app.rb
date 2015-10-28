module Lavanderia
  class App < Padrino::Application
    register SassInitializer
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    layout :app

    use Rack::Session::Cookie
    use OmniAuth::Strategies::Developer

    use OmniAuth::Builder do
      provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
                scope:  'email'
    end

    enable :sessions

    get :index do
      puts ENV['FACEBOOK_KEY']
      puts ENV['FACEBOOK_SECRET']
      "hola"
    end
    get '/auth/:provider/callback' do
      auth    = request.env["omniauth.auth"]
      content_type :json

      user = User.login(auth) || User.create_with_omniauth(auth)
      session[:user] = user.id
      auth.to_json
    end

    get :profile do
      content_type :text
      current_account.to_yaml
    end

  end
end
