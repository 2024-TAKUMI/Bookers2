class Book < ApplicationRecord

  validates :title, presence: true
  validates :caption, presence: true, length: { maximum: 200 }

  has_one_attached :image

end