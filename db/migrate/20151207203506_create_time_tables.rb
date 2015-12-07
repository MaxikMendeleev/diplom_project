class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.integer :count
      t.timestamps null: false
    end
    add_column :time_tables, :user_id, :integer
    add_column :time_tables, :task_id, :integer
  end
end
