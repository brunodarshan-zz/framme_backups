class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :action
      t.integer :model
      t.integer :user, foreign_key: true

      t.timestamps
    end
    remove_column :logs, :updated_at
  end
end
