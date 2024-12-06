class CreateKptBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :kpt_boards do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_on, null: false
      t.date :end_on, null: false
      t.text :keep_action_draft, null: false, default: ""
      t.text :problem_action_draft, null: false, default: ""
      t.text :try_action_draft, null: false, default: ""

      t.timestamps
    end
  end
end
