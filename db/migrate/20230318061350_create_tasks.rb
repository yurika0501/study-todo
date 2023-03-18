class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :post_id, null: false
      t.string :content, null: false
      t.boolean :complete, null: false, default: false

      t.timestamps
    end
  end
end
