class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.references :users, foreign_key: true
      t.string :email
      t.string :district
      t.string :profession

      t.timestamps
    end
  end
end
