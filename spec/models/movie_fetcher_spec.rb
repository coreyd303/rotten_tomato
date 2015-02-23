require 'rails_helper'

RSpec.describe MovieFetcher do
  include WebMock::API

  it "fetches movies from the rotten tomatoes API" do
    WebMock.disable_net_connect!

    key = Figaro.env.rotten_tomatoes_api_key

    stub_request(:get, "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=#{key}&limit=6").
         to_return(:status => 200, :body => "{\"movies\":[{\"title\":\"Fifty Shades of Grey\"}]}" , :headers => {})

    movie = MovieFetcher.new(5)
    expect(movie).to_not be(nil)

    WebMock.allow_net_connect!
  end
end

