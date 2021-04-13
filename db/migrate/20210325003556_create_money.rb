class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.integer :saving_amount, null: false
      t.date :day,              null: false
      t.string :text
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
