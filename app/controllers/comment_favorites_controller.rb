class CommentFavoritesController < ApplicationController
  def create
    comment = Comment.find(params[:id])
    favorite = current_user.comment_favorites.new(user_id: current_user.id, comment_id: comment.id)
    favorite.save
    
  end

  def destroy
    comment_id = Comment.find(params[:id])
    favorite = current_user.comment_favorites.find_by(comment_id: comment_id)
    favorite.destroy
    
  end

end
