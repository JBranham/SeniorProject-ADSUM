class RemoveDateFromAttendance < ActiveRecord::Migration
  def up
    remove_column :attendances, :Date
  end

  def down
    add_column :attendances, :Date, :date
  end
end
