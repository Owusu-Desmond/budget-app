class RecordCategory < ApplicationRecord
  belongs_to :record
  belongs_to :category
end
