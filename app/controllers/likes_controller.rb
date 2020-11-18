class LikesController < ApplicationController
  
  def new
    @like = Like.new(like_params)
    @document = @like.likeable
    if @like.save!
      respond_to do |format|
        format.js { render layout: false, notice: 'Post was successfully Liked.' }
      end
    end
  end

  def destroy
    @like  = Like.find_by(user_id: params[:user_id], likeable_type: params[:likeable_type], likeable_id: params[:id])
    @document = @like.likeable
    @like.destroy
    respond_to do |format|
      format.js { render layout: false, notice: 'Post was successfully destroyed.' }
    end
  end

  private


  def like_params
    params.permit( :likeable_id, :likeable_type, :user_id )
  end
end
