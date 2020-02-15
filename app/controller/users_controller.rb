class UsersController < ApplicationController


  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/new"
    end
  end

  get '/login' do
    erb :"users/login.html"
  end



  post '/login' do
    login(params[:username], params[:password])
    redirect '/reviews'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
