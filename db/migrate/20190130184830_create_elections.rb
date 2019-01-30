class CreateElections < ActiveRecord::Migration[5.1]
  def change
    create_table :elections do |t|
      t.string :name
      t.date :election_date

      t.timestamps
    end
  end
end
