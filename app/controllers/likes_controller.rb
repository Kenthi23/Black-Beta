class LikesController < ApplicationController
  def create
  	if Like.where(post_id:params[:post_id],user_id:current_user.id).blank?
	  	@like = Like.new(post_id:params[:post_id])
	  	@like.user_id = current_user.id
	  	@like.save
	end
	redirect_to :back
  end

  def destroy
  	if Like.where(post_id:params[:post_id],user_id:current_user.id).present?
	  	@like = Like.find_by(post_id:params[:post_id],user_id:current_user.id)
	  	@like.destroy
	end
	redirect_to :back
  end

  private
  def like_params
  	params.require(:post_id)
  end
end
