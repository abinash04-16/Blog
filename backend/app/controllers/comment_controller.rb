class CommentController < ApplicationController
	include UserHelper
	def add
		Comment.create(content: params[:content], user_id: get_user.id, blog_id: params[:blog_id])

		render json: { result: 'success' }
	end


	def getAll

		@comment = Comment.where(blog_id: params[:blog_id])

		render json: { result: 'success', comments: @comment }
	end
end
