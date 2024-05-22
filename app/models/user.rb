class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :books, dependent: :destroy
  has_one_attached :image

  def get_image
    if image.attached?
    image
  else
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    File.open(file_path)
  end
  end

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end