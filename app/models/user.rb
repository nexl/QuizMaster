class User < ApplicationRecord
  
  has_many :quizz 
  has_many :student_answer
  
end
