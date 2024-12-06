class AddDeadlineOnIndexToTasks < ActiveRecord::Migration[8.0]
  def change
    add_index :tasks, :deadline_on
  end
end
