class Quizz < ApplicationRecord

  has_many :question, :dependent => :destroy, :inverse_of => :quizz
  has_many :student, :dependent => :destroy, :inverse_of => :quizz
  belongs_to :user, class_name: "User", :foreign_key => "created_by"

  accepts_nested_attributes_for :question, :allow_destroy => true

end
