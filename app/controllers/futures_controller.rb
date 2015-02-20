class FuturesController < ApplicationController

  def index
    @movies = ordered_movies
    @ranks   = fake_rank
    @date   = DateTime.now
  end

private

  def fake_rank
    nums  = [1,2,3]
    ranks = nums.sample(3, random:1..3)
    ranks
  end
  def ordered_movies
    movies          = Movie.first(3)
    ordered_by_rank = movies.sort { |x,y| y.average_rank <=> x.average_rank }
    ordered_by_rank
  end
end
