class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :mark
      t.string :email
      t.integer :std

      t.timestamps
    end
  end
end
