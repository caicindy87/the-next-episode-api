class CreateSavedShows < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_shows do |t|
      t.integer :rating
      t.string :watch_date
      t.integer :show_id
      t.integer :user_id

      t.timestamps
    end
  end
end
