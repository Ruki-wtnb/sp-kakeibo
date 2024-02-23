class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :price
      t.string :year_month

      t.timestamps
    end
  end
end
