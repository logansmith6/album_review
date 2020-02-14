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

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])
    if params[:username].empty? || params[:password].empty?
      redirect '/failure'
    else
      @user.save
      redirect '/login'
    end
  end

end
