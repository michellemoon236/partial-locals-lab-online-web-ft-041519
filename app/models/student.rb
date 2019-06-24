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

  def self.search(string)
    # binding.pry
#     1) Student search when it receives an empty search argument returns all students
#     Failure/Error: expect(Student.search('').count).to eq(Student.all.count)
    
#     NoMethodError:
#       undefined method `search' for #<Class:0x0b80414c>
#     # ./spec/models/student_spec.rb:15:in `block (4 levels) in <top (required)>'

#  2) Student search when it receives a search query returns all students whose names contain the given string
#     Failure/Error: expect(Student.search('rob').map {|s| s.name}).to match_array(['Robert', 'Roberta'])
    
#     NoMethodError:
#       undefined method `search' for #<Class:0x0b80414c>
#     # ./spec/models/student_spec.rb:21:in `block (4 levels) in <top (required)>'
    self.all.select { |i| i.name.downcase.include?(string) }
  end
end
