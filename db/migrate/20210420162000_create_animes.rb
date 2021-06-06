class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |a|
      a.string :name, null: false
      
      a.timestamps
    end

    add_index :animes, :name, unique: true
  end
end