class CreateFixedCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_costs do |t|
      t.integer :price
      t.string :year_month
      t.string :category_id
      t.timestamps
    end
  end
end
