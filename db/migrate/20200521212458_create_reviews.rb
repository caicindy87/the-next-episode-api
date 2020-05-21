class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.boolean :spoiler, default: false
      t.string :content
      t.integer :saved_show_id

      t.timestamps
    end
  end
end
