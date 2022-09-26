class User::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @user = @post.user
    if params[:new]
      @post.is_draft = false
      if @post.save(context: :publicize)
        flash[:notice] = '投稿が完了しました'
        redirect_to posts_path(@post)
      else
        flash.now[:alert] = '投稿に失敗しました'
        render :new
      end
    else
      if @post.update(is_draft: true)
        flash[:notice] = '下書きを保存しました'
        redirect_to user_path(@user)
      else
        flash.now[:alert] = '下書きの保存に失敗しました'
        render :new
      end
    end
  end

# もしくは公開された投稿のみ表示（タグ検索に対応）
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts.page(params[:page]) : Post.where(is_draft: false).page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if params[:publicize_draft]
      @post.attributes = post_params.merge(is_draft: false)
      if @post.save(context: :publicize)
        flash[:notice] = '下書きを公開しました'
        redirect_to posts_path
      else
        @post.is_draft = true
        flash.now[:alert] = '下書きの公開に失敗しました'
        render :edit
      end
    elsif params[:update_post]
      @post.attributes = post_params
      if @post.save(content: :publicize)
        flash[:notice] = '更新が完了しました'
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '更新に失敗しました'
        render :edit
      end
    else
      if @post.update(post_params)
        flash[:notice] = '下書きを更新しました'
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '下書きの更新に失敗しました'
        render :edit
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id, :is_draft, :created_at, tag_ids: [], post_images: [])
  end

end
