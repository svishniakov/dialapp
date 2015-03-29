class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :notes
      t.date :commissioning
      t.string :serial

      t.timestamps null: false
    end
  end
end
