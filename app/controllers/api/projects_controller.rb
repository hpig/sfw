class Api::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /api/projects
  def index
    render json: Project.all
  end

  # GET /api/projects/23
  def show
    render json: @project
  end

  # POST /api/projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/projects/23
  def update
    if @project.update(project_params)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/projects/23
  def destroy
    @project.destroy
    head :no_content
  end

private

  def set_project()
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
