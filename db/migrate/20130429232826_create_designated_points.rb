class CreateDesignatedPoints < ActiveRecord::Migration
  def change
    create_table :designated_points do |t|
      t.string :name
      t.integer :num
      t.integer :course_id

      t.timestamps
    end
  end
end
