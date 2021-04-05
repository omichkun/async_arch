class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.text :description
      t.integer :added
      t.integer :substracted
      t.string :task_uuid

      t.timestamps
    end
  end
end
