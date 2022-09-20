class User::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    unless @post_comment.save!
      flash[:alert] = 'コメントを入力してください'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    if @post_comment.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if @post_comment.update(post_comment_params)
      flash[:notice] = 'コメントの更新が完了しました'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'コメントの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment.destroy
    flash[:notice] = 'コメントを削除しました'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
