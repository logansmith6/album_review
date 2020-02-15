class UsersController < ApplicationController


  get '/signup' do
    erb :"users/signup"
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

  get '/login' do
    if !logged_in?
      erb :"users/login.html"
    else
      redirect '/reviews'
    end
  end



  post '/login' do
    user = User.find_by(:username => params[:username])

    if params[:username].empty? || params[:password].empty?
      redirect '/failure'
    else
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:username] = params[:username]
        redirect '/reviews'
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
