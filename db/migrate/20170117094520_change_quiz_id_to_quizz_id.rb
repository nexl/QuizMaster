class ChangeQuizIdToQuizzId < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :quiz_id, :quizz_id
  end
end
