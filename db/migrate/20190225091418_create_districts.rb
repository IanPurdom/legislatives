class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :code
      t.references :department, foreign_key: true
      t.string :num_district
      t.string :region
      t.string :code_region

      t.timestamps
    end
  end
end
