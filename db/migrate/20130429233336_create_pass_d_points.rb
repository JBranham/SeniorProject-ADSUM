class CreatePassDPoints < ActiveRecord::Migration
  def change
    create_table :pass_d_points do |t|
      t.integer :course_id
      t.integer :student_id
      t.string :descr
      t.integer :designated_point_id

      t.timestamps
    end
  end
end
