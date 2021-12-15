class UsersController < ApplicationController
  def show
    @user = current_user
    @comments = @user.comments.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_name, :profile, :rank)
  end

end
