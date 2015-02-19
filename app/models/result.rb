class Result < ActiveRecord::Base

  def self.find_movies(num)
    tomatoes = RottenList.find(type: "box_office", limit: num.to_i)
    save_to_db(tomatoes)
  end

  def self.save_to_db(tomatoes)
    checked_movies = Movie.pluck("title")
    tomatoes.map do |tom|
      if checked_movies.include?(tom.title)
        next
      else
        movie_maker(tom)
      end
    end
  end

  def self.movie_maker(tom)
    m = Movie.new
    m.poster_thumbnail_url = tom[:posters][:thumbnail]
    m.title                = tom[:title]
    m.year                 = tom[:year]
    m.mpaa_rating          = tom[:mpaa_rating]
    m.critics_rating       = tom[:ratings][:critics_rating]
    m.critics_score        = tom[:ratings][:critics_score]
    m.audience_rating      = tom[:ratings][:audience_rating]
    m.audience_score       = tom[:ratings][:audience_score]
    m.average_rank         = (m.critics_score.to_i + m.audience_score.to_i)/2
    m.synopsis             = tom.synopsis
    m.movie_details_url    = tom[:links][:alternate]
    m.movie_reviews_url    = tom[:links][:reviews]
    m.save
  end
end