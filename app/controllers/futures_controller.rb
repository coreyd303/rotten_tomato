class FuturesController < ApplicationController

  def index
    @movies = ranked_movies
    @prediction = rand(1..params[:num].to_i)
  end

private

  def ordered_movies
    movies = Movie.first(params[:num])
    ordered_by_rank = movies.sort { |x,y| y.average_rank <=> x.average_rank }
    ordered_by_rank
  end
end

# pull above method into a helper to be used within the classes

# order them within the array
# use there current position as their current rank
# create foe ranking #'s fitting within the range N
  # N being the number of selected movies
