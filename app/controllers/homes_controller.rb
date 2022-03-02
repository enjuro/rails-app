class HomesController < ApplicationController
    def top
        if user_signed_in?
            relationship = Relationship.where(user_id: current_user.id).order(created_at: :desc).pluck(:admin_id)
            followees = Admin.find(relationship)
            @post_images = PostImage.where(admin_id: followees).order(created_at: :desc).page(params[:page]).per(2)
        end
    end

    def links

    end

    def about
    end

end
