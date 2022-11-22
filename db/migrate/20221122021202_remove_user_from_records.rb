class RemoveUserFromRecords < ActiveRecord::Migration[7.0]
  def change
    remove_reference :records, :user, foreign_key: true
  end
end
