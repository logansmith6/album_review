class ReviewsController < ApplicationController

  get '/reviews' do
    if logged_in?
    "You are logged in as #{session[:username]}"
    @reviews = Review.all
    erb :index
    else
      redirect '/login'
    end
  end

  get '/reviews/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'reviews/create_review'
    end
  end


end
