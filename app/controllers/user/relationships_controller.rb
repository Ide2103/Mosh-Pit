class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user.id)
  end

  def followed
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def follower
    user = User.find(params[:user_id])
    @users = user.followings
  end
end
