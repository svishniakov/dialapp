class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :procedure, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.integer :qty

      t.timestamps null: false
    end
  end
end
