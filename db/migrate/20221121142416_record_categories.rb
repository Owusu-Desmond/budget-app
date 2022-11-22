class RecordCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :record_categories do |t|
      t.references :record, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
