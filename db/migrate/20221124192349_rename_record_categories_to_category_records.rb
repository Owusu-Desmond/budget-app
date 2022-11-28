class RenameRecordCategoriesToCategoryRecords < ActiveRecord::Migration[7.0]
  def change
    rename_table :record_categories, :category_records
  end
end
