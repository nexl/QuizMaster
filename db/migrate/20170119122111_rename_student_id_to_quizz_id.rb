class RenameStudentIdToQuizzId < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :student_id, :quizz_id
  end
end
