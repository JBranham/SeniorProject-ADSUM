class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :Date
      t.boolean :present
      t.boolean :absent
      t.boolean :tardy
      t.boolean :excused
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
