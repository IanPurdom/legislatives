class RemoveDistrictFromCandidates < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :district, :string
  end
end
