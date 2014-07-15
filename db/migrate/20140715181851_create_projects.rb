class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :title
    	t.string :description
    	t.integer :goal
    	t.datetime :start_date
    	t.datetime :end_date
      t.timestamps
    end
  end
end
