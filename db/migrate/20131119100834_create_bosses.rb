class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.belongs_to :user
      t.belongs_to :boss

      t.timestamps
    end
  end
end
