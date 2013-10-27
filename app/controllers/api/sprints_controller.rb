class Api::SprintsController < ApplicationController

  def index
    render json: Sprint.all
  end

end
