class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.string :saving_amount, null: false
      t.date :day,             null: false
      t.string :text
      t.references :user,      null: false, foreign_key: true
    # 他のテーブル作成後にカラムを追加する
      # t.references :goal,      null: false, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end