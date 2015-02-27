class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [ :fetch_data ]
  after_action :verify_authorized, except: [ :fetch_data ]

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  
  def fetch_data
    template = {username: "", role: "", id: 0}
    u = User.find(params[:id])
    template[:username] = u.username
    template[:id] = u.id
    template[:role] = u.role
    render json: template
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end
    
  def messages
    @user = current_user
    authorize @user
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  
end
