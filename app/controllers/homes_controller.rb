class HomesController < ApplicationController
    def top
        if user_signed_in?
            relationship = Relationship.where(user_id: current_user.id).order(created_at: :desc).pluck(:admin_id)
            @followees = Admin.find(relationship)
        end
    end

    def links
    end

    def about
    end

end
