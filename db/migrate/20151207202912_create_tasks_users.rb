class CreateTasksUsers < ActiveRecord::Migration
  def change
    create_table :tasks_users do |t|
      t.integer "task_id", null: false
      t.integer "user_id", null: false
    end
    add_index(:tasks_users, [:task_id, :user_id], :unique => true)
  end
end
