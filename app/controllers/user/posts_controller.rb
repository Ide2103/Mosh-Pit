class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if params[:post]
      if @post.save(context: :publicize)
        redirect_to posts_path(@post)
      else
        render :new
      end
    else
      if @post.update(is_draft: true)
        redirect_to user_path(current_user)
      else
        render :new
      end
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id, :is_draft, :created_at, post_images: [])
  end

end
