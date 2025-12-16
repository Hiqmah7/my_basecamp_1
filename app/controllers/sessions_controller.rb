class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/:id
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
