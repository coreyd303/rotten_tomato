class MovieFetcher

  def initialize(num)
    @num = num
    @number_for_api = num + 1
    fetch_movies
  end

  def save_to_db
    @movies.map do |movie|
      if checked_movies.include?(movie['title'])
        next
      else
        Movie.new_from_api(movie)
      end
    end
  end

private

  def fetch_movies
    key = Figaro.env.rotten_tomatoes_api_key
    @response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=#{key}&limit=#{@number_for_api}")
    parse_response
  end

  def parse_response
    @movies_from_api = JSON.parse(@response.body)['movies']
    normalize_for_api_bug
  end

  def checked_movies
    @checked_movies ||= Movie.pluck("title")
  end

  def normalize_for_api_bug
    @movies = @movies_from_api.first(@num)
  end
end