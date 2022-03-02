class PostImagesController < ApplicationController

    before_action :redirect_root, only: [:new, :create, :edit, :update, :destroy]

    def new
        @post_image = PostImage.new
    end

    def create
        @post_image = PostImage.new(post_image_params)
        @post_image.admin_id = current_admin.id
        if @post_image.save
            redirect_to post_images_path
        else
            render :new
        end
    end

    def index
        @post_images = PostImage.order(created_at: :desc).page(params[:page]).per(2)
    end

    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new
    end

    def edit
        @post_image = PostImage.find(params[:id])
    end

    def update
        @post_image = PostImage.find(params[:id])
        if @post_image.update(post_image_params)
            redirect_to post_image_path(@post_image.id)
        else
            render :edit
        end
    end

    def destroy
        @post_image = PostImage.find(params[:id])
        @post_image.destroy
        redirect_to post_images_path
    end




    private

    def post_image_params
        params.require(:post_image).permit(:grade, :color, :wall_type, :image, :caption, :duration)
    end

    def redirect_root
        redirect_to root_path unless admin_signed_in?
    end

end