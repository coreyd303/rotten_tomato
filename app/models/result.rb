class Result < ActiveRecord::Base
include HTTParty

  def self.find_movies(num)
    key = Figaro.env.rotten_tomatoes_api_key
    response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=#{key}&limit=#{num}")
    save_to_db(response)
  end

  def self.save_to_db(response)
    movies = JSON.parse(response.body)
    checked_movies = Movie.pluck("title")
    movies.map do |movie|
      binding.pry
      if checked_movies.include?(movie['title'])
        next
      else
        movie_maker(movie)
      end
    end
  end

  def self.movie_maker(movie)
    m = Movie.new
    m.poster_thumbnail_url = movie[:posters][:thumbnail]
    m.title                = movie[:title]
    m.year                 = movie[:year]
    m.mpaa_rating          = movie[:mpaa_rating]
    m.critics_rating       = movie[:ratings][:critics_rating]
    m.critics_score        = movie[:ratings][:critics_score]
    m.audience_rating      = movie[:ratings][:audience_rating]
    m.audience_score       = movie[:ratings][:audience_score]
    m.average_rank         = (movie.critics_score.to_i + movie.audience_score.to_i)/2
    m.synopsis             = movie.synopsis
    m.movie_details_url    = movie[:links][:alternate]
    m.movie_reviews_url    = movie[:links][:reviews]
    m.save
  end
end