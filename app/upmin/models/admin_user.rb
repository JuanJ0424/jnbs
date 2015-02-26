class AdminUser < Upmin::Model
  attributes :email, :name, :last_name, :username, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
              :current_sign_in_ip, :last_sign_in_ip, :unconfirmed_email, :role

  

end