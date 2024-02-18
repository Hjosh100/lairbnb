class AddDescriptionToLairs < ActiveRecord::Migration[7.1]
  def change
    add_column :lairs, :description, :text
  end
end
