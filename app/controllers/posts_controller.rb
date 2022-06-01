class PostsController < ApplicationController
	before_action :check_user, only: [ :create, :edit, :update ]
	def index
		@posts = Post.all.paginate(page: params[:page], per_page: 6)
	end

	def show
		@post = Post.where(id: params[:id]).first
	end

	def create
		@post = current_user.posts.new(post_params)

  		if @post.save
  			redirect_to user_path(current_user)
  		else
  			@user = current_user
  			@posts = @user.posts.paginate(page: params[:page], per_page: 6)
  			render 'users/show', status: 422
  		end
	end

	def edit
		@post = Post.find(params[:id])
		if !own_post?(@post)
			redirect_to user_path(current_user), status: 422
		end
	end

	def update
		@post = Post.find(params[:id])

		if own_post?(@post)
			if @post.update(post_params)
				redirect_to user_path(current_user)
			else
				render 'posts/edit', status: 422
			end
		else
			redirect_to user_path(current_user), status: 422
		end
	end

	private
  	def post_params
  		params.require(:post).permit(:title, :description)
  	end
end
