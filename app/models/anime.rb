class Anime < ApplicationRecord
  # Un anime tiene muchos personajes (1-N), y si borran el anime se borran los personajes para no dejarlos huerfanos
  has_many :characters, dependent: :destroy
    
  # Como extra no vamos a dejar dos animes con el mismo nombre
  validates :name, presence: true, uniqueness: true
end