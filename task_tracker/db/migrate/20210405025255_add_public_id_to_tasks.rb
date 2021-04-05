class AddPublicIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :public_id, :uuid, default: "uuid_generate_v4()", null: false
  end
end
