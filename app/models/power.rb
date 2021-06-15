class Power < ApplicationRecord
  belongs_to :character

  validates :element, presence: true


  before_create :element_type

  private 
    def element_type
        
        elements = ["fire", "air", "water", "earth", "thunder"]
        power_element = self.element.downcase
        
      unless elements.include? power_elements
        self.element = 'Eres débil, Sasuke... Te falta odio'
      end

    end
         

end
