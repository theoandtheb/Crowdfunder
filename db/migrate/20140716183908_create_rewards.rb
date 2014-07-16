class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :amount
      t.integer :backers
      t.text :reward
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
