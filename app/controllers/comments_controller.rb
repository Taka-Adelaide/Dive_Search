class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    # @comments = Comment.all
    @comments = Comment.includes(:user, :spot).page(params[:page]).reverse_order
  end

  def new
    @comment = Comment.new
    @spot = Spot.find(params[:spot_id])
    @spots = Spot.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @spot = Spot.find(params[:spot_id])

    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to spot_path(@comment.spot.id)
    else
      flash[:alert] = "コメントを入力してください"
      redirect_to new_spot_comment_path(@spot)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
    @spot = @comment.spot
    @comments = Comment.includes(:user, :spot).page(params[:page]).reverse_order
  end

  def edit
    @comment = Comment.find(params[:id])
    @spot = Spot.find(params[:spot_id])
    @spots = Spot.all
  end

  def update
    @comment = Comment.find(params[:id])
    @spot = Spot.find(params[:spot_id])

    if @comment.update(comment_params)
      flash[:notice] = "コメントを編集しました"
      # redirect_to user_path(current_user.id)
      redirect_to spot_comment_path(@comment)
    else
      flash[:alert] = "入力してください"
      redirect_to edit_spot_comment_path(@spot)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @spot = Spot.find(params[:spot_id])

    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "コメントを削除できませんでした。もう一度試してください。"
      redirect_to edit_spot_comment_path(@spot)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:spot_id, :title, :comment, :image)
  end

  def correct_user
    comment = Comment.find(params[:id])
    user = comment.user
    if user != current_user
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
end