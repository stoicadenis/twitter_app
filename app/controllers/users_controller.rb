class UsersController < ApplicationController
	def index
		# @ se foloseste pentru variabile globale
		# fara @ sunt doar var locale
  		@users = User.all
  	end

  	def show
  		@user = User.where(id: params[:id]).first
  	end
end
