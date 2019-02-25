class RemoveDepartmentFromCandidates < ActiveRecord::Migration[5.2]
  def change
    remove_reference :candidates, :department, foreign_key: true
  end
end
