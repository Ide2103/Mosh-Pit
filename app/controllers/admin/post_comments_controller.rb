class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
