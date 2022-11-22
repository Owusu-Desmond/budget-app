class AddAuthorRefToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :user, null: false, foreign_key: true
  end
end
