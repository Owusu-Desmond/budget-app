class Record < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :record_categories, dependent: :destroy
    has_many :categories, through: :record_categories


    validates :amount, presence: true
    
end
