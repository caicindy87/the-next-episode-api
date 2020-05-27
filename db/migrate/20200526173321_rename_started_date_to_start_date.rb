class RenameStartedDateToStartDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :shows, :started_date, :start_date
  end
end
