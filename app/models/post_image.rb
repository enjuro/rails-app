class PostImage < ApplicationRecord
    belongs_to :admin
    attachment :image
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :image, presence: true
    validates :caption, presence: true
    validates :grade, presence: true
    validates :color, presence: true
    validates :wall_type, presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
