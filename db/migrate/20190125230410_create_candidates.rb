class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.string :district
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :profession

      t.timestamps
    end
  end
end
