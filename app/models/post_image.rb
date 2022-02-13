class PostImage < ApplicationRecord
    belongs_to :admin
    attachment :image
    has_many :post_comments, dependent: :destroy
end
