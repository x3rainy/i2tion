class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.integer :age
      t.string :gender
      t.string :activity_status
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
