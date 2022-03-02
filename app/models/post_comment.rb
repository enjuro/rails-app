class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post_image

    validates :comment, length: { maximum: 140 }
end
