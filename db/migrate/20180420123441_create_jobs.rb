class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.integer :client, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
