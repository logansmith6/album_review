class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "small_mountain"
  end

  get '/' do
    redirect '/login'
  end

  get '/failure' do
    erb :failure
  end


  helpers do

    def logged_in?
      !!user_online
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

    def user_online
      @user_online ||= User.find_by(:username => params[:username]) if session[:username]
    end


  end



end
