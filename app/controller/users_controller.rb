class UsersController < ApplicationController


  get '/signup' do #takes user to signup.erb to make an acccount
    erb :"users/signup"
  end


  post '/signup' do #saves user info to user model
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/new"
    end
  end


  get '/login' do #takes user to login page
    erb :"users/login.html"
  end


  post '/login' do #logs in user and takes them to /reviews if they pass login method
    login(params[:username], params[:password])
    redirect '/reviews'
  end

  get '/logout' do #clears the session and logs out user
    session.clear
    redirect '/'
  end

end
