class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :poster_thumbnail_url
      t.string :title
      t.string :year
      t.string :mpaa_rating
      t.string :critics_rating
      t.string :critics_score
      t.string :audience_rating
      t.string :audience_score
      t.string :movie_details_url
      t.string :movie_reviews_url
    end
  end
end
