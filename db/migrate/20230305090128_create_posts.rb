class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :list1
      t.text :list2
      t.text :list3
      t.text :list4
      t.text :list5
      t.text :list6
      t.text :list7
      t.text :list8
      t.text :list9
      t.text :list10
      t.integer :user_id
      t.timestamps
    end
  end
end
