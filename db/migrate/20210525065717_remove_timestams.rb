class RemoveTimestams < ActiveRecord::Migration[6.0]
  def change
    remove_timestamps(:words)
  end
end
