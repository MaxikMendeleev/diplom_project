class CreateStatusCompletes < ActiveRecord::Migration
  def change
    create_table :status_completes do |t|
      t.string :name
      t.timestamps null: false
    end
    add_index :status_completes, :name, unique: true
  end
end
