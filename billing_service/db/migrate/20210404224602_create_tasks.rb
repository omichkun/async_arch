class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :user_uuid
      t.integer :price
      t.integer :reward

      t.timestamps
    end
  end
end
