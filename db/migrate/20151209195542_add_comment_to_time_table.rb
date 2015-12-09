class AddCommentToTimeTable < ActiveRecord::Migration
  def change
    add_column :time_tables, :comment, :string
    add_column :time_tables, :work_day, :date
  end
end
