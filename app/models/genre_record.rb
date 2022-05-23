class GenreRecord < ApplicationRecord
  belongs_to :record
  belongs_to :genre
  
  validates :record_id, presence: true
  validates :genre_id, presence: true
end
