class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :type_of_problem_id, :integer
    add_column :tasks, :status_complete_id, :integer
    add_column :tasks, :lead_time, :integer
  end
end
