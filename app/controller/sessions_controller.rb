class SessionsController < ApplicationController


  get '/signup' do
    erb :"sessions/signup"
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
    erb :"sessions/login.html"
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if params[:username].empty? || params[:password].empty?
      redirect '/failure'
    else
      if user && user.authenticate(params[:password])
        sesion[:user_id] = user.id
        redirect '/post'
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
