class ReviewsController < ApplicationController

  get '/reviews' do #if user is logged in, takes them to a page displaying all the reviews
    if logged_in?
    @reviews = Review.all
    erb :index
    else
      redirect '/login'
    end
  end

  post '/reviews' do #if all the stuff is filled out, it saves the new review
    if logged_in?
      if params[:content] == "" || params[:artist] == "" || params[:album_name] == "" || params[:rating] == "" || params[:genre] == ""
        redirect '/reviews/new'
      else
        @review = user_online.reviews.build(:album_name => params[:album_name], :artist => params[:artist], :genre => params[:genre], :rating => params[:rating], :content => params[:content])
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


  get '/reviews/new' do  #sends user to page to make new review, or sends them to login if they aren't
    if !logged_in?
      redirect '/login'
    else
      erb :'reviews/create_review'
    end
  end


  get '/reviews/:id' do #to specific reviews own page
    if logged_in?
      @review = Review.find_by_id(params[:id])
      erb :'reviews/show'
    else
      redirect '/login'
    end
  end


  get '/reviews/:id/edit' do #sends user to edit their own reviews
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


  patch '/reviews/:id' do #saves edit from user for their own review
    @review = Review.find_by_id(params[:id])

    @review.album_name = params[:album_name]
    @review.genre = params[:genre]
    @review.artist = params[:artist]
    @review.rating = params[:rating]
    @review.content = params[:content]
    @review.save
    redirect "/reviews/#{@review.id}"
  end

  get '/reviews/:id/delete' do #deletes review if it is users own
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == user_online
        @review.delete
        @review.save
      end
        redirect '/reviews'
      else
        redirect '/login'


    end
  end
end
