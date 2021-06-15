class Character < ApplicationRecord
  # Un personaje pertenece a 1 anime (1-N)
  belongs_to :anime

  ####has_many :powers
  
  # Verifico que el nombre no sea vacio
  validates :name, presence: true

  # Como extra, no quiero que ningun personaje no tenga una biografia, entonces antes de crearlos les asigno una si es vacia
  before_create :not_el_mystery

  private
    def not_el_mystery
      unless self.biography
        self.biography = "Por que sin biografía?, quien sos? Juan pito?"
      end
    end
end