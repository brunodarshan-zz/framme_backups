class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :description

      t.timestamps
    end
    remove_column :logs, :updated_at
  end
end
