class ResultsController < ApplicationController
include RottenTomatoes

  def index
    allowed_nums = ["5","10","15","20","25"]

    if allowed_nums.include?(params[:num])
      Result.find_movies(params[:num])
      @movies = ordered_movies
      request_checker
    else
      flash[:danger] = "Please select a valid number of movies from the drop down!"
      redirect_to root_path
    end
  end

private

  def request_checker
    requested = params[:num].to_i
    if requested != @movies.count
      flash[:warning] = "Sorry we could not find the top #{requested} movies, but here are:"
    end
  end

  def ordered_movies
    movies = Movie.first(params[:num])
    ordered_by_rank = movies.sort { |x,y| y.average_rank <=> x.average_rank }
    ordered_by_rank
  end

end
