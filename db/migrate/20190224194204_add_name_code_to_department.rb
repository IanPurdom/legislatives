class AddNameCodeToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :name_code, :string
  end
end
