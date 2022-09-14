class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
       redirect_to user_path(@user.id), notice: "更新が完了しました"
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
       @user.destroy
       redirect_to root_path
    end
  end 
  
  def unsubscribe
    @user = current_user
  end 

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon_image, :address, :age, :my_favorite, :live_stance, :status)
  end

end