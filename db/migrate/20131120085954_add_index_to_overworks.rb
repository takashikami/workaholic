class AddIndexToOverworks < ActiveRecord::Migration
  def change
    add_index :overworks, [:user_id, :work_date], unique: true
  end
end
