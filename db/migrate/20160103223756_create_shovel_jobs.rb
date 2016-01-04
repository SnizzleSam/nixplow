class CreateShovelJobs < ActiveRecord::Migration
  def change
    create_table :shovel_jobs do |t|
      t.references :shovel_user, index: true
      t.references :owner_user, index: true
      t.datetime :start_date
      t.boolean :owner_confirmation

      t.timestamps null: false
    end
  end
end
