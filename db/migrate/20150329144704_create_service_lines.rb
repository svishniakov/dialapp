class CreateServiceLines < ActiveRecord::Migration
  def change
    create_table :service_lines do |t|
      t.references :equipment, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.date :service_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
