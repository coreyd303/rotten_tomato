class ResultsController < ApplicationController

  def index
    @movies = get_movies
  end

private

  def get_movies
    allowed_nums = ["5","10","15","20","25"]

    if allowed_nums.include?(params[:num])
      MovieFetcher.new(params[:num].to_i).save_to_db
      @movies = ordered_movies
    else
      flash[:danger] = "Please select a valid number of movies from the drop down!"
      redirect_to root_path
    end
  end

  def ordered_movies
    movies = Movie.first(params[:num])
    movies.sort { |x,y| y.average_rank <=> x.average_rank }
  end

end
