class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:username]}"
  end

  get '/posts/new' do
    if !logged_in?
      redirect '/login'
    else
      "new posts here"
    end
  end


end
