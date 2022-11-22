class CreateRecordCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :record_categories do |t|

      t.timestamps
    end
  end
end
