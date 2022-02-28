class HomesController < ApplicationController
    def top

        relationship = Relationship.where(user_id: current_user.id).order(created_at: :desc).pluck(:admin_id)
        @followees = Admin.find(relationship)

    end

    def links
    end

    def about
    end

end
