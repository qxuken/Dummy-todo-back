class AddPositionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :position, :integer
    Task.reindex_positions
  end
end
