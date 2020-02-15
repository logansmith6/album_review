class ReviewsController < ApplicationController

  get '/reviews' do
    if logged_in?
    "You are logged in as #{session[:username]}"

    else
      redirect '/login'
    end
  end

  get '/reviews/new' do
    if !logged_in?
      redirect '/login'
    else
      "new posts here"
    end
  end


end
