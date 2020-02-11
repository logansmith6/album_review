class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "smallmountain"
  end

  get '/' do
    session[:email] = params[:email]
    "Hello World."
  end

end
