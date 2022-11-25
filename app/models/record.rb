class Record < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_records, dependent: :destroy
  has_many :categories, through: :category_records

  validates :amount, presence: true
end
