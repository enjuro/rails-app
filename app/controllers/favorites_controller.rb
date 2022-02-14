class FavoritesController < ApplicationController
    def create
        @post_image = PostImage.find(params[:post_image_id])
        unless @post_image.favorited_by?(current_user)
            favorite = current_user.favorites.new(post_image_id: @post_image.id)
            favorite.save
        end
    end

    def destroy
        @post_image = PostImage.find(params[:post_image_id])
        favorite = current_user.favorites.find_by(post_image_id: @post_image.id)
        favorite.destroy
    end
end
