class FuturesController < ApplicationController

  def index
    @movies = ordered_movies
    @one_week = @movies.shuffle
    @date   = DateTime.now
  end

private

  def ordered_movies
    movies          = Movie.first(3)
    ordered_by_rank = movies.sort { |x,y| y.average_rank <=> x.average_rank }
    ordered_by_rank
  end
end
