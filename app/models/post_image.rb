class PostImage < ApplicationRecord
    belongs_to :admin
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :images, dependent: :destroy
    accepts_attachments_for :images, attachment: :image

    validates :caption, presence: true
    validates :grade, presence: true
    validates :color, presence: true
    validates :wall_type, presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
