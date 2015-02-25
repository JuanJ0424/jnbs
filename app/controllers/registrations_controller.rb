class RegistrationsController < Devise::RegistrationsController

  layout 'signs', only: :new
  
  # def new
  #   super
  # end

  # def create
  #   super
  # end
end
