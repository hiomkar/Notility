class DropCourse < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :courses
  end
end
