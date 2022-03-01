class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
