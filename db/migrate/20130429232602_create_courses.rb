class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :user_id
      t.date :f_day
      t.date :l_day

      t.timestamps
    end
  end
end
