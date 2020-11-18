class Users::PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = @user.posts.order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def new
    @post = @user.posts.new({user_id: current_user.id, title: "", body: ""})

    respond_to do |format|
      if @post.save
        format.html { render :edit , notice: 'Post was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
  end

  def update
    update_params = post_params
    update_params[:status] = params[:status].to_i
    respond_to do |format|
      if @post.update(update_params)
        if @post.draft?
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        else
          format.html { redirect_to @post, notice: 'Post was successfully published.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
