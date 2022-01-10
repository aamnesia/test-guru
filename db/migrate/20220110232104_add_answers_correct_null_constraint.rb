class AddAnswersCorrectNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :answers, :correct, false
  end
end
