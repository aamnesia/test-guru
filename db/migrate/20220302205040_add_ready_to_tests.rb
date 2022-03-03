class AddReadyToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :ready, :boolean, default: false
  end
end
