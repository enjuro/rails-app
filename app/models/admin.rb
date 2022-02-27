class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  has_many :relationships, dependent: :destroy

  attachment :profile_image

  validates :gym, presence: true

  def followed_by?(user)
    relationships.where(user_id: user.id).exists?
end
end
