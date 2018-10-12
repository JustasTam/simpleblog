class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'Justas', password: '12345', only: [:destroy]

  def create
    @post = get_post
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @comment = get_post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  def get_post
    Post.find(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
