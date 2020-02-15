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
    if logged_in?
      if params[:content] == "" || params[:album_name] == "" || params[:rating] == "" || params[:genre] == ""
        redirect '/reviews/new'
      else
        @review = user_online.reviews.build(:album_name => params[:album_name], :genre => params[:genre], :rating => params[:rating], :content => params[:content])
        if @review.save
          redirect "/reviews/#{@review.id}"
        else
          redirect '/reviews/new'
        end
      end
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
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == user_online
        erb :'reviews/edit'
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
