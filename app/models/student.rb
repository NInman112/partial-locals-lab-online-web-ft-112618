# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student_search)
    if student_search == "" || student_search.nil?
      Student.all
    else
      Student.all.select {|student| student.name.downcase.include?(name.downcase)}
    end
  end

end
