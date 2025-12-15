class ProjectsController < ApplicationController
  before_action :require_login, except: :index
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/:id
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      ProjectMember.create(project: @project, user: current_user, role: :manager)
      redirect_to projects_path, notice: "Project created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /projects/:id/edit
  def edit
  end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project deleted successfully!"
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_owner!
    redirect_to projects_path, alert: "Not authorized" unless @project.owner?(current_user)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
