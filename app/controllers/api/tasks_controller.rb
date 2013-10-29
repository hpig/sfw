class Api::TasksController < ApplicationController

  before_action :set_story
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /api/projects/23/stories/42/tasks
  def index
    render json: @story.tasks
  end

  # GET /api/projects/23/stories/42/tasks/875
  def show
    render json: @task
  end

  # POST /api/projects/23/stories/42/tasks
  def create
    @task = @story.tasks.new(task_params)

    if @task.save
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/projects/23/stories/42/tasks/875
  def update
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/projects/23/stories/42/tasks/875
  def destroy
    @task.destroy
    head :no_content
  end

private

  def set_story()
    @story = Sprint.find(params[:story_id])
  end

  def set_task()
    @task = @story.tasks.find(params[:id])
  end

  def task_params
    params.require(:story).permit(:description, :label, :status)
  end

end
