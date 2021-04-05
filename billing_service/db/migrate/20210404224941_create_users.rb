class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :public_id
      t.string :role
      t.string :email
      t.boolean :active
      t.integer :balance

      t.timestamps
    end
  end
end
