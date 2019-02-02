class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.references :candidate, foreign_key: true
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :validation_date

      t.timestamps
    end
  end
end
