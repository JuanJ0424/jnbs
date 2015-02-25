class CreateAdminService
  def call
    user = User.find_or_create_by!(username: Rails.application.secrets.admin_username) do |user|
    		user.email = Rails.application.secrets.admin_email
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.credit_card = "4916937361000100"
        user.cvv = 123
        user.name = "Notion"
        user.last_name = "Engineering"
        user.confirm!
        user.admin!
      end
  end
end
