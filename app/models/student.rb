class Student < ActiveRecord::Base
  belongs_to :course
  has_many :attendances, dependent: :destroy
  has_many :pass_d_points, dependent: :destroy
  
  attr_accessible :fname, :preferred_name, :lname, :student_no, :course_id, :points, :attendances_attributes, :pass_d_points_attributes
  
  accepts_nested_attributes_for :attendances, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

#spreadsheet looping
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      student = find_by_id(row["id"]) || new
      student.attributes = row.to_hash.slice(*accessible_attributes)
      student.save!
    end
  end

#Configure for filetype
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end