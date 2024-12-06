class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false
      t.text :memo, null: false, default: ''
      t.boolean :enabled, null: false, default: true

      t.timestamps
    end
  end
end
