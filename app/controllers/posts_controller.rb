class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Error: Your new post could not be created."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    @post.update(post_params)
    flash[:success] = "Your post was updated"
    redirect_to(post_path(@post))
  end

  def destroy
    @post.destroy
    flash[:success] = "Your post was deleted"
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
