class Api::SprintsController < ApplicationController

  before_action :set_project
  before_action :set_sprint, only: [:show, :update, :destroy]

  # GET /api/projects/23/sprints
  def index
    render json: @project.sprints
  end

  # GET /api/projects/23/sprints/42
  def show
    render json: @sprint
  end

  # POST /api/projects/23/sprints
  def create
    @sprint = @project.sprints.new(sprint_params)

    if @sprint.save
      render json: @sprint, status: :ok
    else
      render json: @sprint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/projects/23/sprints/42
  def update
    if @sprint.update(sprint_params)
      head :no_content
    else
      render json: @sprint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/projects/23/sprints/42
  def destroy
    @sprint.destroy
    head :no_content
  end

private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_sprint
    @sprint = @project.sprints.find(params[:id])
  end

  def sprint_params
    params.require(:sprint).permit(:project_id, :begin_date, :end_date)
  end

end
