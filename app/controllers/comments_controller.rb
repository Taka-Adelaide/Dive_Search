class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
    @spots = Spot.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to spot_path(@comment.spot.id)
  end

  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
    @spot = @comment.spot
    
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
    @spots = Spot.all
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:spot_id, :comment, :image)
  end

end
