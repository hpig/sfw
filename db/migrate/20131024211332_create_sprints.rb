class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
