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
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:spot_id, :comment, :image)
  end

end
