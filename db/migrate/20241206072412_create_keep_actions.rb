class CreateKeepActions < ActiveRecord::Migration[8.0]
  def change
    create_table :keep_actions do |t|
      t.references :kpt_board, null: false, foreign_key: true
      t.string :content, null: false
      t.text :memo, null: false, default: ""
      t.boolean :enabled, null: false, default: true
      t.references :try_action, foreign_key: true

      t.timestamps
    end
  end
end
