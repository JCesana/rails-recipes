class AddColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :comments_count, :integer, default: 0
  end
end
