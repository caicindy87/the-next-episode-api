class RenameEndedDateToEndDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :shows, :ended_date, :end_date
  end
end
