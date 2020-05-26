class RemoveWatchDateFromSavedShows < ActiveRecord::Migration[6.0]
  def change
    remove_column :saved_shows, :watch_date, :string
  end
end
