class Category < ApplicationRecord
    belongs_to :user
    has_many :record_categories, dependent: :destroy
    has_many :records, through: :record_categories

    validates :name, presence: true
    validates :author_id, presence: true
end
