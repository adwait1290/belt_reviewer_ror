class CommentsController < ApplicationController
	def create
		Comment.create comment_params
		redirect_to :back
	end
	def destroy 
		@comment = Comment.find(params[:id])
		@comment.destroy if current_user.id == @comment.user_id
		redirect_to :back

	end

	private
	def comment_params
		params.require(:comment).permit(:content, :event_id).merge(user: current_user)
	end
end
