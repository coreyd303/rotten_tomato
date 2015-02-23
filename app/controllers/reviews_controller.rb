class ReviewsController < ApplicationController

  def index
    @reviews = ReviewFetcher.new(params[:movie_id]).get_reviews
    @movie   = Movie.find_by(params[:movie_id])
  end

end
