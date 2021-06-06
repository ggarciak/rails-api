class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |c|
      c.string :name, null: false
      c.text :biography
      
      c.timestamps
    end

    add_index :characters, :name, unique: true
    
    add_reference :characters, :anime, foreign_key: true
  end
end