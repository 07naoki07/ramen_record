class Record < ApplicationRecord

 has_one_attached :image
 belongs_to :user
 
 has_many :likes, dependent: :destroy
 has_many :comments, dependent: :destroy
 
end