class CommentController < ApplicationController
	def add
		Comment.create(content: params[:content], user_id: params[:user_id], blog_id: params[:blog_id], user_mail: params[:user_mail])

		render json: { result: 'success' }
	end


	def getAll

		@comment = Comment.where(blog_id: params[:blog_id])

		render json: { result: 'success', comments: @comment }
	end
end
