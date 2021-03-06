class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
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

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "You can't edit this post"
      redirect_to root_path
    end
  end

end
