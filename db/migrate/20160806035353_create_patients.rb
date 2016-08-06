class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :status
      t.integer :viewed_count

      t.timestamps null: false
    end
  end
end
