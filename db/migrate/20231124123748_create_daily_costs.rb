class CreateDailyCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_costs do |t|
      t.date :pay_date
      t.string :category_id
      t.string :detail
      t.integer :price

      t.timestamps
    end
  end
end
