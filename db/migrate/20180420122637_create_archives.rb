class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :name, null: false
      t.integer :type_archive
      t.integer :resolution, default: 0
      t.integer :environment
      t.integer :status

      t.string :description

      t.integer :size
      t.string :directory

      t.timestamps
    end
  end
end
