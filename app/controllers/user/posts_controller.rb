class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if params[:new]
      @post.is_draft = false
      if @post.save(context: :publicize)
        redirect_to posts_path(@post)
      else
        render :new
      end
    else
      if @post.update(is_draft: true)
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts.page(params[:page]) : Post.where(is_draft: false).page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find_by(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id, :is_draft, :created_at, tag_ids: [], post_images: [])
  end

end
