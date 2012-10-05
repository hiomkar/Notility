class AddTagIndexToNote < ActiveRecord::Migration
  def change
    add_column :notes, :tag, :string
  end
end
