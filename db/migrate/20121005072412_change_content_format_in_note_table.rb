class ChangeContentFormatInNoteTable < ActiveRecord::Migration
  def change
    change_column :notes, :content, :longtext
  end
end
