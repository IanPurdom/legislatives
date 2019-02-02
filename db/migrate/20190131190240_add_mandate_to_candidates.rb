class AddMandateToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :mandate, :string
  end
end
