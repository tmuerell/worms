class AddPlaceToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :place, :integer
  end
end
