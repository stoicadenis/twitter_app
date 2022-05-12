class UsersController < ApplicationController
	before_action :check_user, only: [:index, :show]

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

  	private
  	def user_params
  		params.require(:user).permit(:name, :email, :age, :gender, :phone_number, :password)
  	end

  	def check_user
  		if !logged_in?
  			redirect_to login_path
  		end
  	end
end
