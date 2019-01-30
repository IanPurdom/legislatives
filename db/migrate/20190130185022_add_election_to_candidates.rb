class AddElectionToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :election, foreign_key: true
  end
end

