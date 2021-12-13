class CommentFavoritesController < ApplicationController
  def create

    comment = Comment.find(params[:id])

    favorite = current_user.comment_favorites.new(user_id: current_user.id, comment_id: comment.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    comment_id = Comment.find(params[:id])
    favorite = current_user.comment_favorites.find_by(comment_id: comment_id)
    favorite.destroy
    redirect_to request.referer
  end

end
