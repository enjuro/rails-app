class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_admin, through: :follower, source: :followed


  attachment :profile_image

  validates :name, presence: true

  def follow(admin_id)
    follower.create(followed_id: admin_id)
  end

  # ユーザーのフォローを外す
  def unfollow(admin_id)
    follower.find_by(followed_id: admin_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(admin)
    following_admin.include?(admin)
  end

end
