class SalePolicy
	attr_reader :current_user, :sale

	def initialize current_user, sale
		@current_user = current_user
		@sale = sale
	end

	def index?
		current_user.admin?
	end

	def show?
		current_user.admin? or @current_user == @sale.user
	end

	# No need of 'new?' because the controller has set before_filter :authenticate_user!
	# and any user can create a new sale

	def edit?
		current_user.admin? or @current_user == @sale.user
	end

	# No need of 'create?' because the controller has set before_filter :authenticate_user!
	# and any user can create a new sale

	def update?
		current_user.admin? or @current_user == @sale.user
	end

	def destroy?
		current_user.admin? or @current_user == @sale.user
	end

end