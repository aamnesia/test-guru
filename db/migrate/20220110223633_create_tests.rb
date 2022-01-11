class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category

      t.timestamps
    end
  end
end
