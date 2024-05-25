class CreateCategoryTotals < ActiveRecord::Migration[7.0]
  def change
    create_table :category_totals do |t|
      t.integer :price
      t.string :category_id
      t.string :year_month

      t.timestamps
    end
  end
end
