class FixColumnForREalz < ActiveRecord::Migration
  def change
    change_column :goals, :visible, :boolean, null: false, default: nil
    change_column :goals, :completed, :boolean, null: false, default: nil
  end
end
