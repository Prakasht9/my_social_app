class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
    render layout: false
  end

  def edit
    render layout: false
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.save

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def update
    @comment.update(comment_params)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end
