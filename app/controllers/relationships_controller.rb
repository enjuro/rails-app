class RelationshipsController < ApplicationController
    def create
        @admin = Admin.find(params[:admin_id])
        unless @admin.followed_by?(current_user)
            relationship = current_user.relationships.new(admin_id: @admin.id)
            relationship.save
        end
    end

    def destroy
        @admin = Admin.find(params[:admin_id])
        relationship = current_user.relationships.find_by(admin_id: @admin.id)
        relationship.destroy
    end
end
