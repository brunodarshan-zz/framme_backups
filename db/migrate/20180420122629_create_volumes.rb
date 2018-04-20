class CreateVolumes < ActiveRecord::Migration[5.1]
  def change
    create_table :volumes do |t|
      t.string :name
      t.integer :type

      t.integer :type
      t.integer :in_use
      t.integer :capacity

      t.timestamps
    end
  end
end
