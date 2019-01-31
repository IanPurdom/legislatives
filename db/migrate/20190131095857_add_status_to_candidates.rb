class AddStatusToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :status, foreign_key: true
  end
end
