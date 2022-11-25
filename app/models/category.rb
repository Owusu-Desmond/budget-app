class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_records, dependent: :destroy
  has_many :records, through: :category_records

  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
  validates :author_id, presence: true
  validates :icon, presence: true
end
