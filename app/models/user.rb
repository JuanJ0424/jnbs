class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  attr_accessor :login

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_encryptor :credit_card, key: "dfsnkjiq3o4ytcioASDFASDFq345q2c424vbw4"
  attr_encryptor :cvv, key: "jsd9fsd9fASDFgt34St24"
  attr_encryptor :name, key: "sdfasdfGSDFGsdg44"
  attr_encryptor :last_name, key: "sdfasdfGSDFGsdg44"

  has_many :sales, dependent: :nullify

  validates :credit_card, presence: true, format: {with: /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})\z/}
  validates :cvv, presence: true, format: {with: /\A([0-9]){3,4}\z/}

  # Not necesary, because email regexp is set in config/initializers/devise.rb
  #validates :email, format: {with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/}, uniqueness: true

  validates :name, presence: true, format: {with: /\A[A-ZÁÉÍÓÚÑ\s]{1}[A-Za-zÁÉÍÓÚáéíóúñÑ\s]{2,49}\z/}
  validates :last_name, presence: true, format: {with: /\A[A-ZÁÉÍÓÚÑ\s]{1}[A-Za-zÁÉÍÓÚáéíóúñÑ\s]{2,49}\z/}

  validates :username, presence: true, uniqueness: {case_sensitive: false},
            length: { in: 4..20, too_short: "Tiene que tener al menos 4 caracteres", too_long: "Debe tener máximo 20 caracteres" },
            format: { with: /([A-Za-z0-9\-\_\.]+)/, message: "Username sólo puede contener letras, números, guiones y puntos" }


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  def get_user_sales
    sales = []
    rel_sales = self.sales
    rel_sales.each do |rs|
      sales.push rs
    end
    sales
  end

end
