class UsersController < ApplicationController
	def index
		# @ se foloseste pentru variabile globale
		# fara @ sunt doar var locale
  		@users = User.all
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
  		user = User.new(
  			name: params['user']['name'], 
  			email: params['user']['email'], 
  			age: params['user']['age'], 
  			gender: params['user']['gender'], 
  			phone_number: params['user']['phone_number']
  			)

  		if user.save
  			flash[:success] = 'User creat cu succes!'
  			redirect_to "/users/#{user.id}"
  		else
  			flash[:error] = 'Validations failed'
  			redirect_to '/users/new'
  		end
  	end
end
