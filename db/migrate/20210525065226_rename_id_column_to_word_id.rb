class RenameIdColumnToWordId < ActiveRecord::Migration[6.0]
  def change
    rename_column :words, :id, :word_id
  end
end
