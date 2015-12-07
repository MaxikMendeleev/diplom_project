class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
      t.string :name
      t.timestamps null: false
    end
    add_index :specializations, :name, unique: true
  end
end
