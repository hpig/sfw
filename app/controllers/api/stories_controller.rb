class Api::StoriesController < ApplicationController

  before_action :set_sprint
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /api/projects/23/sprints/42/stories
  def index
    render json: @sprint.stories
  end

  # GET /api/projects/23/sprints/42/stories/875
  def show
    render json: @story
  end

  # POST /api/projects/23/sprints/42/stories
  def create
    @story = @sprint.stories.new(story_params)

    if @story.save
      render json: @story, status: :ok
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/projects/23/sprints/42/stories/875
  def update
    if @story.update(story_params)
      head :no_content
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/projects/23/sprints/42/stories/875
  def destroy
    @story.destroy
    head :no_content
  end

private

  def set_sprint()
    @sprint = Project.find(params[:sprint_id])
  end

  def set_story()
    @story = @sprint.stories.find(params[:id])
  end

  def story_params
    params.require(:sprint).permit(:name, :description, :points)
  end
end
