class AddMovieToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :movie, :string
  end
end
