class Quizz < ApplicationRecord

  has_many :question

  belongs_to :user, class_name: "User", :foreign_key => "created_by"

end
