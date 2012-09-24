class AddCourseIdIndexToNote < ActiveRecord::Migration
  def change
    add_index(:notes, [:course_id, :created_at], :name => 'by_course')
  end
end
