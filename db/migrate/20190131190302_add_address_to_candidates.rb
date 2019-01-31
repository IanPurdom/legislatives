class AddAddressToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :address, :string
  end
end
