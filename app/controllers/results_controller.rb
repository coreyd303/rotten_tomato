class ResultsController < ApplicationController
include RottenTomatoes

  def index
    allowed_nums = ["5","10","15","20","25"]

    if allowed_nums.include?(params[:num])
      Result.find_movies(params[:num])
      @movies = Movie.all
    else
      flash[:danger] = "Please select a valid number of movies from the drop down!"
      redirect_to root_path
    end
  end
end
