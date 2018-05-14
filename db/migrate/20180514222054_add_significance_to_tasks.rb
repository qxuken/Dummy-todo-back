class AddSignificanceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :significance, :integer, default: 1
  end
end
