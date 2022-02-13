class PostImagesController < ApplicationController

    before_action :redirect_root, only: [:new, :create, :edit, :destroy]

    def new
        @post_image = PostImage.new
    end

    def create
        @post_image = PostImage.new(post_image_params)
        @post_image.admin_id = current_admin.id
        @post_image.save
        redirect_to post_images_path
    end

    def index
        @post_images = PostImage.all
    end

    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new
    end

    def destroy
        @post_image = PostImage.find(params[:id])
        @post_image.destroy
        redirect_to post_images_path
    end

    private

    def post_image_params
        params.require(:post_image).permit(:grade, :color, :wall_degree, :image, :caption)
    end

    def redirect_root
        redirect_to root_path unless admin_signed_in?
    end

end

