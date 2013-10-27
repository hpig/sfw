class AngularController < ApplicationController

  def show
    # renders an angular view as given as id
    render params[:id], layout: nil
  end

end
