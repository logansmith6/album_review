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
    erb :"users/login.html"
    redirect '/reviews'
  end



  post '/login' do
    login(params[:email], params[:password])
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
