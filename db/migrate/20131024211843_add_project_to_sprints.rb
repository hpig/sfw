class AddProjectToSprints < ActiveRecord::Migration
  def change
    add_reference :sprints, :project, index: true
  end
end
