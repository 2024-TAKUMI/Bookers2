class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィール情報が更新されました。successfully"
      redirect_to edit_user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :title,:body ,:image)
  end
end