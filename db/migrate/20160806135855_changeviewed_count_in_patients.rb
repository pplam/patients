class ChangeviewedCountInPatients < ActiveRecord::Migration
  def change
      change_column :patients, :viewed_count, :integer, default: 0
  end
end
