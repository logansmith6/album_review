class SessionsController < ApplicationController


  get '/login' do
    erb :"sessions/login.html"
  end

  post '/sessions' do
    session[:username] = params[:username]
    redirect '/posts'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
