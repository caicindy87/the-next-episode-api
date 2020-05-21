class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :started_date
      t.string :ended_date
      t.string :network
      t.string :country
      t.string :status
      t.string :image

      t.timestamps
    end
  end
end
