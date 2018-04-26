class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :name
      t.integer :size
      t.integer :type_archive
      t.integer :resolution
      t.integer :environment
      t.string :description
      t.string :directory
      t.references :volume, foreign_key: true
      t.datetime :inserted_in

      t.timestamps
    end
  end
end
