class ChangeGoalVisibleDefault < ActiveRecord::Migration
  def change
    change_column :goals, :visible, :boolean, null: false
    change_column :goals, :completed, :boolean, null: false
  end
end

# goals
#  visible     :boolean          default(TRUE), not null
#  completed   :boolean          default(FALSE), not null
