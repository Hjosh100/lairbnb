class CreateLairs < ActiveRecord::Migration[7.1]
  def change
    create_table :lairs do |t|
      t.string :category
      t.string :title
      t.string :location
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
