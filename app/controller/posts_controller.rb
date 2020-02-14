class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:username]}"
  end

  get '/posts/new' do
    if !session[:username]
  end


end
