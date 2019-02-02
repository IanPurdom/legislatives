class RemoveFirstnameFromCandidates < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidates, :first_name, :string
  end
end
