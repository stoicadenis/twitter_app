class UsersController < ApplicationController
	before_action :check_user, only: [:index, :show, :destroy, :update]
	before_action :admin_user, only: [:destroy, :update]
	def index
		# @ se foloseste pentru variabile globale
		# fara @ sunt doar var locale
		if logged_in?
  			@users = User.all
  		else

  		end
  	end

  	def show
  		@user = User.where(id: params[:id]).first
  		if @user.nil?
  			redirect_to "/users"
  		else
  			@posts = @user.posts.paginate(page: params[:page], per_page: 6)
  			@post = Post.new
  		end
  	end

  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)

  		if @user.save
  			flash[:success] = 'User creat cu succes!'
  			log_in(@user)
  			redirect_to "/users/#{@user.id}"
  		else
  			render 'users/new'
  		end
  	end

  	def destroy
  		@user = User.find(params[:id])
  		@user.destroy
  		redirect_to '/users'
  	end

  	def update
  		@user = User.find(params[:id])
  		@user.update(admin: true)
  		redirect_to '/users'
  	end

  	def following
  		@title = 'Following'
  		@user = User.find(params[:id])
  		@users = @user.following.paginate(page: params[:page], per_page: 1)
  		render 'show_follow'
  	end

  	def followers
  		@title = 'Followers'
  		@user = User.find(params[:id])
  		@users = @user.followers.paginate(page: params[:page], per_page: 1)
  		render 'show_follow'
  	end

  	def reply
  		@title = 'Reply'
  		@posts = Post.find(params[:id])
  		# @users = @user.followers.paginate(page: params[:page], per_page: 1)
  		render 'show_follow'
  	end

  	private
  	def user_params
  		params.require(:user).permit(:name, :email, :age, :gender, :phone_number, :password)
  	end

end
