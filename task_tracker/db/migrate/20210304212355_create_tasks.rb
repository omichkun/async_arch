class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
