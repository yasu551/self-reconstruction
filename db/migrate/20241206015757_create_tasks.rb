class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :completion_condition, null: false, default: ''
      t.text :content, null: false, default: ''
      t.text :yesterday_content, null: false, default: ''
      t.text :memo, null: false, default: ''
      t.string :status, null: false, default: 'pending'
      t.date :deadline_on

      t.timestamps
    end
  end
end
