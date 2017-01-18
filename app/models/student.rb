class Student < ApplicationRecord

  has_many :student_answer, :dependent => :destroy
  
end
