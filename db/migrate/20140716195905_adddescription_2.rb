class Adddescription2 < ActiveRecord::Migration
  def change
  	add_column :rewards, :description, :text
  end
end
