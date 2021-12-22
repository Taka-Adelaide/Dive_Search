class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @comments = @user.comments.all
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
      redirect_to request.referer
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

end
