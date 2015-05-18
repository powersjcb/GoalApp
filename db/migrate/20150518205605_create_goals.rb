class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :body, null: false, default: ""
      t.boolean :visible, null: false, default: true
      t.integer :user_id, null: false, index: true
      t.boolean :completed, null: false, default: false
      t.date :target_date, null: false

      t.timestamps null: false
    end
  end
end
