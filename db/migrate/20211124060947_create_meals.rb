class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.integer :amount, null: false
      t.text :info
      t.integer :meal_time_id, null: false
      t.integer :calorie, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
