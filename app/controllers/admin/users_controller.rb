class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_comments = @user.post_comments
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = '更新が完了しました'
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon_image, :address, :age, :my_favorite, :live_stance, :status)
  end

end
