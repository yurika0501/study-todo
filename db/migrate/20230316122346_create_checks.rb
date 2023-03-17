class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.boolean :checkbox1
      t.boolean :checkbox2
      t.boolean :checkbox3
      t.boolean :checkbox4
      t.boolean :checkbox5
      t.boolean :checkbox6
      t.boolean :checkbox7
      t.boolean :checkbox8
      t.boolean :checkbox9
      t.boolean :checkbox10
    end
  end
end
