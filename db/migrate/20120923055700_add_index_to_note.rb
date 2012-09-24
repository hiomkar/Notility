class AddIndexToNote < ActiveRecord::Migration
  def change
    add_index(:notes, [:user_id, :created_at], :name => 'by_user')
  end
end
