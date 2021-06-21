module UserHelper
	$current_user = nil

	def set_user(user)
		$current_user = user
	end

	def get_user
		$current_user
	end


	def remove_user
		$current_user = nil
	end

end