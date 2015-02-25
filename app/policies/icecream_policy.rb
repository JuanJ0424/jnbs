class IcecreamPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
	end

	def can_do?
		@current_user.admin?
	end
end