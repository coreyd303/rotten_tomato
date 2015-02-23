class ReviewFetcher

  def initialize(movie_id)
    @movie_id = movie_id
  end

  def get_reviews
    key = Figaro.env.rotten_tomatoes_api_key
    @reviews_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{@movie_id}/reviews.json?apikey=#{key}")
    parse_reviews_response
  end

  def parse_reviews_response
    @reviews = JSON.parse(@reviews_response)
  end
end