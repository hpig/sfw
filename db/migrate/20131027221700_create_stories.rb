class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.references :sprint, index: true

      t.timestamps
    end
  end
end
