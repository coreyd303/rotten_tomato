class AddMovieIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_id, :string
  end
end
