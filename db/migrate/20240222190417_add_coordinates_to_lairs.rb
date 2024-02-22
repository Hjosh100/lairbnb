class AddCoordinatesToLairs < ActiveRecord::Migration[7.1]
  def change
    add_column :lairs, :latitude, :float
    add_column :lairs, :longitude, :float
  end
end
