class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|

      t.integer :weight_goal, null: false
      t.integer :saving_goal, null: false
      t.text :purpose,       null: false
      t.date :period,        null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
