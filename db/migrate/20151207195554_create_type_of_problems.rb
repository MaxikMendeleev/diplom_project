class CreateTypeOfProblems < ActiveRecord::Migration
  def change
    create_table :type_of_problems do |t|
      t.string :name
      t.timestamps null: false
    end
    add_index :type_of_problems, :name, unique: true
  end
end
