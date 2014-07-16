class Adddescription < ActiveRecord::Migration
  def change
  	remove_column :rewards, :reward, :text
  end
end
