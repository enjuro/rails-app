class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).order(created_at: :desc).pluck(:post_image_id)
    @favorite_post_images = PostImage.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def follows
    admin = Admin.find(params[:id])
    @admins = admin.following_user.page(params[:page]).per(3).reverse_order
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :bio)
  end
end
