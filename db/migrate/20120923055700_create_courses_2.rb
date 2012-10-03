class CreateCourses2 < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name

      t.timestamps
    end
  end
end
