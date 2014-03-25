class CreateOffs < ActiveRecord::Migration
  def change
    create_table :offs do |t|
      t.integer :user_id, null: false
      t.date :off_date, null: false
      t.string :subject, null: false, default: ''
      t.float :off_days, null: false, default: 1.0
      t.integer :off_type, null: false, default: 0
      t.integer :off_half_type
      t.time :off_quarter_time
      t.integer :fy, null: false

      t.timestamps
    end
    add_index :offs, :fy
    add_index :offs, :user_id
    add_index :offs, :off_type
  end
end
