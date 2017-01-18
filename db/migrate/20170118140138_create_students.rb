class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :student_id
      t.string :full_name
      t.string :token

      t.timestamps
    end
  end
end
