class AddLocationIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :location_id, :integer
  end
end
