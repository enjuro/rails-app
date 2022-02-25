class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @post_images = @admin.post_images.page(params[:page]).reverse_order
    @follower_users = @user.follower_user
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admin_path(@admin.id)
  end


  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :profile_image, :gym, :url, :bio)
  end
end

