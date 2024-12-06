class AddContentDiffToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :content_diff, :text, null: false, default: ""
  end
end
