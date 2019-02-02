class AddNextActionToStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :next_action, :string
  end
end
