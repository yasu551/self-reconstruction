class CreateProblemActions < ActiveRecord::Migration[8.0]
  def change
    create_table :problem_actions do |t|
      t.references :kpt_board, null: false, foreign_key: true
      t.string :content, null: false
      t.text :memo, null: false, default: ""

      t.timestamps
    end
  end
end
