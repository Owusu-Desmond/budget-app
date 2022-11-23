class AddDefaultIconToCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, default: "https://p.kindpng.com/picc/s/459-4595417_category-overview-icon-hd-png-download.png"
  end
end
