class AddTagIndexToNote < ActiveRecord::Migration
  def change
    add_column :notes, :tag, :string
    add_index(:notes, [:user_id, :created_at], :name => 'by_user')
  end
end
