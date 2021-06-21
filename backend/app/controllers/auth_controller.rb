class AuthController < ApplicationController

	include UserHelper

	def login

		@user = User.find_by(email: params[:email])

		if @user.valid?

			if @user.valid_password?(params[:password])
				sign_in @user

				set_user(current_user)
				render json: { result: 'success', user: current_user, mail: @user.email, id: @user.id}
			else
				render json: { result: 'failure', message: 'password incorrect' }
			end
		else
			render json: { result: 'failure', message: 'email invalid' }
		end

	end


	def register

		if User.find_by(email: params[:email]) == nil

			user = User.create!(firstname: params[:firstName], lastname: params[:lastName], email: params[:email], password: params[:password])

			render json: { status: 'success', mail: user.email, id: user.id }
		else
			render json: { status: 'failed', message: 'email already taken' }
		end
	end

	def editUser

		@user = current_user

		@user.update( firstname: params[:firstName], lastname: params[:lastName])

		render json: { result: 'success' }

	end


	def isAuth
		if $current_user != nil
			render json: { result: true }
		else
			render json: { result: false }
		end
	end

	def logout
		$current_user = nil

		render json: { result: 'success' }
	end

	def getUser
		@user = User.find_by(id: params[:id])

		render json: { result: 'success', user: @user }
	end

	def getCurrentUser
		render json: { result: 'success', user: get_user }
	end

	def updateUser
		@user = User.find(get_user.id)

		@user.update( firstname: params[:firstname], lastname: params[:lastname])

		set_user(@user)

		render json: { result: 'success', user: get_user}
	end

	def getAllUser

		@userList = User.all

		render json: { users: @userList }
	end
end
