require 'rails_helper'

RSpec.describe MovieFetcher do
  include WebMock::API

  it "fetches reveiws from the rotten tomatoes API" do
    WebMock.disable_net_connect!

    stub_request(:get, "http://api.rottentomatoes.com/api/public/v1.0/movies/771311953/reviews.json?").
         to_return(status: 200, body: "{\"reviews\":[{\"critic\":\"Anthony Lane\"}]}" , headers: {})

    review = ReviewFetcher.new(771311953)
    expect(review).to_not be(nil)

    WebMock.allow_net_connect!
  end
end

