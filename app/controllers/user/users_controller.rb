class User::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def index
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :address, :age, :my_favorite, :live_stance, :status, :icon_image)
  end

end