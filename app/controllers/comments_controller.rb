class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Your comment has been posted succesfully"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong, please try again"
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Your comment was deleted"
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
