class CreateDailyReports < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_reports do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.date :reported_on, null: false
      t.text :content, null: false, default: ''
      t.text :keep_action_draft, null: false, default: ''
      t.text :problem_action_draft, null: false, default: ''
      t.text :try_action_draft, null: false, default: ''

      t.timestamps
    end

    add_index :daily_reports, :reported_on
    add_index :daily_reports, %i(user_id reported_on), unique: true
  end
end
