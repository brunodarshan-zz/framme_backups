class AddForeignKeysToArchive < ActiveRecord::Migration[5.1]
  def change
    add_reference :archives, :job, foreign_key: true
    add_reference :archives, :volume, foreign_key: true
  end
end
