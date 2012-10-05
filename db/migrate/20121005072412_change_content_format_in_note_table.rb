class ChangeContentFormatInNoteTable < ActiveRecord::Migration
  def change
    change_column :note, :content, :longtext
  end
end
