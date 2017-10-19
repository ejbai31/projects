# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  has_many :enrollments,
  class_name: :Enrollment,
  primary_key: :id,
  foreign_key: :course_id

  has_many :students,
  through: :enrollments,
  source: :user

  belongs_to :prerequisites,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: :Prerequisite

  belongs_to :instructors,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :Instructor

end
