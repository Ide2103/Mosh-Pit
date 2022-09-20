class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to admin_user_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id, :is_draft, :created_at, tag_ids: [], post_images: [])
  end
end
