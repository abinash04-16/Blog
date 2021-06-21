class BlogController < ApplicationController
  include UserHelper
  def add

  	Blog.create(title: params[:title], user_id: get_user.id, maincontent: params[:maincontent], content1: params[:content1], content2: params[:content2], image: params[:file] )

  	render json: { result: 'success', user: get_user }

  end

  def show
  	@blog = Blog.all

  	render json: { result: 'success', blog: @blog }
  end

  def myBlogs
  	
  	@blog = Blog.where(user_id: params[:user_id])

  	render json: { result: 'success', blog: @blog }
  end


  def singleBlog
  	
  	@blog = Blog.find_by(id: params[:blog_id])

  	render json: { result: 'success', blog: @blog }
  end

  def updateBlog
  	@blog = Blog.find_by(id: params[:blog_id] )


  	@blog.update(title: params[:title],maincontent: params[:maincontent], content1: params[:content1], content2: params[:content2])
  	#blog.title = params[:title]
  	#blog.maincontent = params[:maincontent]
  	#blog.content1 = params[:content1]
  	#blog.content2 = params[:content2]

  	#@blog.save

  	render json: { result: 'success' }
  end

  def delBlog

  	@blog = Blog.find_by(id: params[:blog_id] )

  	@blog.destroy

  	render json: { result: 'success' }

  end
end
