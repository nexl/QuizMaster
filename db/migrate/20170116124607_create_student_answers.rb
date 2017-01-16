class CreateStudentAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :student_answers do |t|
      t.integer :student_id
      t.integer :question_id
      t.string :answer
      t.boolean :is_right

      t.timestamps
    end
  end
end
