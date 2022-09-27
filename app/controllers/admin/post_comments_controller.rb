class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to admin_post_comments_path
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
