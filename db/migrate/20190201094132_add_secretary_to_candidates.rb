class AddSecretaryToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :secretary
  end
end
