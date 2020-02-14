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

  post

end
