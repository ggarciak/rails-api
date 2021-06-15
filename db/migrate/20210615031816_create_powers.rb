class CreatePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :powers do |t|
      t.string :name
      t.string :element
      t.integer :damage_points
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
