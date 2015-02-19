class AddAverageRankToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :average_rank, :integer
  end
end
