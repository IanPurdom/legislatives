class AddActionToAudits < ActiveRecord::Migration[5.1]
  def change
    add_column :audits, :action, :string
  end
end
