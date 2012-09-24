class DropNotes < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :notes
  end
end
