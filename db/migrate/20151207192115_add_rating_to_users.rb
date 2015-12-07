class AddRatingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating, :integer
    add_column :users, :specialization_id, :integer
  end
end
