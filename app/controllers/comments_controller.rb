class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		
	end

	def test
		raise
		
	end


	private

	def comment_params
		params.require(:comment).permit(
				:user_id,
				:book_id,
				:comment,
				:score
		)
	end
end
