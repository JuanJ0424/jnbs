class CreateAdminService
  def call
    user = User.find_or_create_by!(username: Rails.application.secrets.admin_username) do |user|
  		user.email = Rails.application.secrets.admin_email
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.credit_card = Rails.application.secrets.admin_credit_card
      user.cvv = Rails.application.secrets.admin_cvv
      user.name = Rails.application.secrets.admin_name
      user.last_name = Rails.application.secrets.admin_last_name
      user.confirm!
      user.admin!
    end
  end
end
