class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :set_admin, :remove_admin]
  before_action :require_login, only: [:show, :index, :destroy, :set_admin, :remove_admin]
  before_action :authorize_admin!, only: [:index, :set_admin, :remove_admin]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id
  def show
  end

  # GET /users (admin only)
  def index
    @users = User.all
  end

  # PATCH /users/:id/set_admin
  def set_admin
    if @user.update(role: :admin)
      redirect_to users_path, notice: "#{@user.name} is now an admin!"
    else
      redirect_to users_path, alert: "Failed to update user role"
    end
  end

  # PATCH /users/:id/remove_admin
  def remove_admin
    if @user.update(role: :member)
      redirect_to users_path, notice: "#{@user.name} is no longer an admin!"
    else
      redirect_to users_path, alert: "Failed to update user role"
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account deleted successfully!"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
