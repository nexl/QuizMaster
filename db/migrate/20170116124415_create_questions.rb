class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :quiz_id
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
