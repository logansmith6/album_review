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

  post '/reviews' do
    @review = Review.create(:album_name => params[:album_name], :genre => params[:genre],
                            :content => params[:content], :rating => params[:rating],
                            :user_id => params[:user_id])

    if params[:album_name].empty? || params[:genre].empty? || params[:content].empty? || params[:user_id].empty? || params[:rating].empty?
          redirect '/reviews/new'
    else
        @review.save
        redirect to "/reviews/#{@review.id}"
    end
  end

  get '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    erb :show
  end

  get '/reviews/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'reviews/create_review'
    end
  end


end
