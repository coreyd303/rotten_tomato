class FuturesController < ApplicationController

  def index
    @movies   = ordered_movies
    @week_one = movie_shuffler
    @week_two = movie_shuffler
    @date     = DateTime.now
  end

private

  def ordered_movies
    movies = Movie.first(params[:num] || 10)
    movies.sort { |x,y| y.average_rank <=> x.average_rank }.map{ |m| m.title }
  end

  def movie_shuffler
    @movies.shuffle
  end
end