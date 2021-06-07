class AddStatsToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :hp, :int, default: 100
    add_column :characters, :evil, :boolean, default: false
  end
end
