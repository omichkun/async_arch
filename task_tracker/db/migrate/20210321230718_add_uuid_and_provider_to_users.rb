class AddUuidAndProviderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uuid, :string
    add_column :users, :provider, :string
  end
end
