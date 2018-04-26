class AddUserToArchiveAndVolume < ActiveRecord::Migration[5.1]
  def change
    add_reference :archives, :user, foreign_key: true
    add_reference :volumes, :user, foreign_key: true
  end
end
