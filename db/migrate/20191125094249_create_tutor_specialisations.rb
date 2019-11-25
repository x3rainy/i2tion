class CreateTutorSpecialisations < ActiveRecord::Migration[5.2]
  def change
    create_table :tutor_specialisations do |t|
      t.references :specialisation, foreign_key: true
      t.references :tutor, foreign_key: true

      t.timestamps
    end
  end
end
