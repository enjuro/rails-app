class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @post_images = @admin.post_images.reverse_order.page(params[:page]).per(2)
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admin_path(@admin.id)
  end


  private

  def admin_params
    params.require(:admin).permit(:profile_image, :gym, :url, :bio)
  end
end

