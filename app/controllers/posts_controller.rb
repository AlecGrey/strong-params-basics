class PostsController < ApplicationController

	before_action :find_post, only: [:show, :update, :edit]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.create(sanitized_params)
	  redirect_to post_path(@post)
	end

	def update
	  @post.update(sanitized_params)
	  redirect_to post_path(@post)
	end

	def edit
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def sanitized_params
		params.require(:post).permit(:title, :description)
	end

end
