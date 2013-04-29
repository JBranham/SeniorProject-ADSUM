class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.integer :student_no
      t.integer :points
      t.string :preferred_name
      t.integer :course_id

      t.timestamps
    end
  end
end
