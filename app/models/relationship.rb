class Relationship < ApplicationRecord
    validates :user_id, presence: true, uniqueness: {scope: :admin_id}
    validates :admin_id, presence: true
    belongs_to :user
    belongs_to :admin
end
