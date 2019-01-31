class RemoveLastnameFromCandidates < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidates, :last_name, :string
  end
end
