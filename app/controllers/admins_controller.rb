class AdminsController < ApplicationController

  before_action :redirect_root, only: [:edit]
  before_action :set_q, only: [:search]


  def show
    @admin = Admin.find(params[:id])
    @post_images = @admin.post_images.reverse_order.page(params[:page]).per(2)
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admin_path(@admin.id)
    else
      render :edit
    end
  end

  def search
    @admins = @q.result
  end

  private

  def admin_params
    params.require(:admin).permit(:profile_image, :gym, :url, :bio)
  end

  def redirect_root
    redirect_to root_path unless admin_signed_in?
  end

  def set_q
    @q = Admin.ransack(params[:q])
  end
end

