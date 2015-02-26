class SalePolicy
	attr_reader :current_user, :sale_detail

	def initialize current_user, sale_detail
		@current_user = current_user
		@sale_detail = sale_detail
	end

	def index?
		current_user.admin?
	end

	def show?
		current_user.admin? or @current_user == @sale_detail.user
	end

	# No need of 'new?' because the controller has set before_filter :authenticate_user!
	# and any user can create a new sale_detail

	def edit?
		current_user.admin? or @current_user == @sale_detail.user
	end

	# No need of 'create?' because the controller has set before_filter :authenticate_user!
	# and any user can create a new sale_detail

	def update?
		current_user.admin? or @current_user == @sale_detail.user
	end

	def destroy?
		current_user.admin? or @current_user == @sale_detail.user
	end

end