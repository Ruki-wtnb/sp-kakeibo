class RemoveNameIdFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :name_id
  end
end
