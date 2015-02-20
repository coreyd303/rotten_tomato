class Movie < ActiveRecord::Base

  def find_average
    (critics_score.to_i + audience_score.to_i)/2
  end

  def self.new_from_api(movie)
    m = self.new
    m.poster_thumbnail_url = movie["posters"]["thumbnail"]
    m.title                = movie["title"]
    m.year                 = movie["year"]
    m.mpaa_rating          = movie["mpaa_rating"]
    m.critics_rating       = movie["ratings"]["critics_rating"]
    m.critics_score        = movie["ratings"]["critics_score"]
    m.audience_rating      = movie["ratings"]["audience_rating"]
    m.audience_score       = movie["ratings"]["audience_score"]
    m.synopsis             = movie["synopsis"]
    m.movie_details_url    = movie["links"]["alternate"]
    m.movie_reviews_url    = movie["links"]["reviews"]
    m.average_rank         = m.find_average
    m.save
  end
end

