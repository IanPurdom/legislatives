class RemoveSecretaryFromCandidates < ActiveRecord::Migration[5.2]
  def change
    remove_reference :candidates, :secretary
  end
end
