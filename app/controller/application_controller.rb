class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "small_mountain"
  end

# sets "homepage" to be the login page
  get '/' do
    redirect '/login'
  end
# if sent here, failure message will be displayed from failure.erb
  get '/failure' do
    erb :failure
  end

#helper functions
  helpers do

    def logged_in? #if logged in, returns true
      !!user_online
    end

    def login(username, password) #function to login user
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def logout! #logs out / clears the session
      session.clear
    end

    def user_online #returns the current user of the session
      @user_online ||= User.find_by(:username => session[:username]) if session[:username]
    end

  end
end
