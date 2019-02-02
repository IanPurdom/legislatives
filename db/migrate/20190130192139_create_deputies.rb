class CreateDeputies < ActiveRecord::Migration[5.1]
  def change
    create_table :deputies do |t|
      t.string :first_name
      t.string :last_name
      t.references :candidate, foreign_key: true
      t.string :profession
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
