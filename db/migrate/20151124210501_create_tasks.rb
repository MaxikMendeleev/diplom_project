class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :complete
      t.string :info
      t.integer :project_id
      t.timestamps null: false
    end
    add_index :tasks, [:project_id, :created_at]
  end
end
