class CreateOverworks < ActiveRecord::Migration
  def change
    create_table :overworks do |t|
      t.integer :user_id, null: false
      t.date :work_date, null: false
      t.string :subject, null: false, default: ''
      t.time :work_start_time, null: false, default: 0
      t.time :work_finish_time, null: false, default: 0
      t.float :work_hours, null: false, default: 0.0
      t.string :comment, null: false, default: ''
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
