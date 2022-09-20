class SearchesController < ApplicationController
  def search
		search = params[:search]
		@model=search[:model]
		@content=search[:content]
		@method=search[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method).page(params[:page])
		elsif @model == 'post'
			@records = Post.search_for(@content, @method).page(params[:page])
		elsif @model == 'post_comment'
			@records = PostComment.search_for(@content, @method).page(params[:page])
    end
    
  end
end