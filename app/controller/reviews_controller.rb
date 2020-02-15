class ReviewsController < ApplicationController

  get '/reviews' do
    if logged_in?
    @reviews = Review.all
    erb :index
    else
      redirect '/login'
    end
  end

  post '/reviews' do
    @review = Review.new(:album_name => params[:album_name], :genre => params[:genre], :content => params[:content], :rating => params[:rating], :user_id => params[:user_id])

    if params[:album_name].empty? || params[:genre].empty? || params[:content].empty? || params[:rating].empty?
          redirect '/reviews/new'
    else
        @review.save
        redirect to "/reviews/#{@review.id}"
    end
  end



  get '/reviews/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'reviews/create_review'
    end
  end

  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      erb :'reviews/show'
    else
      redirect '/login'
    end
  end

  get '/reviews/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      review = Review.find(params[:id])
      if review.user_id == user_online.id
      erb :'/reviews/edit'
      else
        redirect '/reviews'
      end
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by_id(params[:id])

    @review.album_name = params[:album_name]
    @review.genre = params[:genre]
    @review.rating = params[:rating]
    @review.content = params[:content]
    @review.save
    redirect "/reviews/#{@review.id}"
  end

  delete '/reviews/:id' do
    Review.destroy(params[:id])
    redirect '/reviews'
  end


end
