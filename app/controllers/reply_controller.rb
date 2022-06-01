class ReplyController < ApplicationController
	before_action :check_user, only: [ :index ]

	def show
		@user = current_user
  		if @user.nil?
  			redirect_to "/users"
  		else
  			@post = Post.where(id: params[:id]).first
  			@replies = @post.replies
  			@reply = Reply.new
  		end
	end

	def create
		@reply = current_user.replies.new(reply_params)
	end

	private
  	def reply_params
  		params.require(:reply).permit(:message)
  	end
end
