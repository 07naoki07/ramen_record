class Genre < ApplicationRecord
  has_many :genre_records, dependent: :destroy
  has_many :records, through: :genre_records
  
  validates :name, presence: true
end
