class AddPositionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :position, :integer
    Rake::Task['tasks:reindex_positions'].invoke
  end
end
