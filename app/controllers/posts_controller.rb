class PostsController < ApplicationController
  def index
    @posts = Post.where(status: 2).order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user, :likes).order(created_at: :desc)
  end
end
