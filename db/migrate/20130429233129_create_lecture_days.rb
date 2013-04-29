class CreateLectureDays < ActiveRecord::Migration
  def change
    create_table :lecture_days do |t|
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.integer :course_id

      t.timestamps
    end
  end
end
