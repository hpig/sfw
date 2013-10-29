class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :label
      t.string :status
      t.references :story, index: true

      t.timestamps
    end
  end
end
