class CreateQuizzs < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzs do |t|
      t.integer :created_by
      t.string :quiz_name

      t.timestamps
    end
  end
end
