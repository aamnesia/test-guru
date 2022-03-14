class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_url
      t.string :rule
      t.string :parameter

      t.timestamps
    end
  end
end
