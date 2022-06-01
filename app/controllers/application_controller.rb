class ApplicationController < ActionController::Base
	include SessionsHelper
	def hello
		if logged_in?
			redirect_to users_path
		else
			redirect_to login_path
		end
		# render html: "Hello, salut!"
	end

	def alta_ruta
		# render html: "Ai intrat pe alta ruta!"
	end

	def create_user
	    user = User.create(name: params[:bla])
	    # render html: "Userul a fost creat #{user.id}"
  	end

  	private
  	def check_user
  		if !logged_in?
  			redirect_to login_path
  		end
  	end
  	def admin_user
  		redirect_to(root_url) unless current_user.admin?
  	end
  	
end
