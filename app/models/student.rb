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
    #binding.pry
    if student_search.empty?
      @students = Student.all
    else
      Student.all.each do |student|
        student.where("title like ?", "%#{student_search}%")
      end
    end
  end


end
