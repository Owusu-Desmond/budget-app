class AddAuthorToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :author, foreign_key: { to_table: :users }
  end
end
