class ReviewsController < ApplicationController

  get '/posts' do
    if logged_in?
    "You are logged in as #{session[:username]}"
    else
      redirect '/login'
    end
  end

  get '/posts/new' do
    if !logged_in?
      redirect '/login'
    else
      "new posts here"
    end
  end


end
