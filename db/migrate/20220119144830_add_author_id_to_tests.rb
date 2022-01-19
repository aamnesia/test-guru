class AddAuthorIdToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :author_id, :integer
  end
end
