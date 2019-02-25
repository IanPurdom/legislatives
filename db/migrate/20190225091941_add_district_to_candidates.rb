class AddDistrictToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidates, :district, foreign_key: true
  end
end
