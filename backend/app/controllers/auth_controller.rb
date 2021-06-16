class AuthController < ApplicationController

	$current_user = nil

	def login

		@user = User.find_by(email: params[:email])

		if @user.valid?

			if @user.valid_password?(params[:password])
				$current_user = @user
				render json: { result: 'success', user: @user, mail: @user.email, id: @user.id}
			else
				render json: { result: 'failure', message: 'password incorrect' }
			end
		else
			render json: { result: 'failure', message: 'email invalid' }
		end

	end


	def register

		if User.find_by(email: params[:email]) == nil

			user = User.create!(email: params[:email], password: params[:password])

			render json: { status: 'success', mail: user.email, id: user.id }
		else
			render json: { status: 'failed', message: 'email already taken' }
		end
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

end
