class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.string :email
      t.string :public_id
      t.boolean :active
      t.string :token
      t.datetime :token_expires_at

      t.timestamps
    end
  end
end
