class Record < ApplicationRecord

 has_one_attached :image
 belongs_to :user

 has_many :likes, dependent: :destroy
 has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
