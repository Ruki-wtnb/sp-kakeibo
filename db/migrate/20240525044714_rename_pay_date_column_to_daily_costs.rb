class RenamePayDateColumnToDailyCosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :daily_costs, :pay_date, :pay_day
  end
end
