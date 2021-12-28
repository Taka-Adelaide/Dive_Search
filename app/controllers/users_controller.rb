class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = current_user
    # @comments = @user.comments.all
    @comments = @user.comments.includes(:spot).page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "編集できませんでした。もう一度試してください"
      redirect_to edit_user_path(@user.id)
    end
  end

  def unsubscribe
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    flash[:alert] = "退会しました。"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_name, :profile, :rank)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      flash[:alert] = "権限がありません"
    end
  end
end
