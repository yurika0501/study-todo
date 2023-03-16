class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.boolean :check_list1
      t.boolean :check_list2
      t.boolean :check_list3
      t.boolean :check_list4
      t.boolean :check_list5
      t.boolean :check_list6
      t.boolean :check_list7
      t.boolean :check_list8
      t.boolean :check_list9
      t.boolean :check_list10
    end
  end
end
