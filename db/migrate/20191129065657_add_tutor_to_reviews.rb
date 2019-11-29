class AddTutorToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :tutor, foreign_key: true
  end
end
