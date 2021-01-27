class Record < ApplicationRecord
  # Relaciones
  belongs_to :person

  # Validaciones
  validates :entrance_temperature, 
            presence: true, 
            length: {  minimum: 4, maximum: 4 }, 
            numericality: {  greater_than_or_equal_to: 32, less_than_or_equal_to: 42 }

  validates :departure_temperature, 
            presence: true, 
            length: {  minimum: 4, maximum: 4 }, 
            numericality: {  greater_than_or_equal_to: 32, less_than_or_equal_to: 42 }

  # Buscador
  def self.search_by(search_term)
    where("Date(created_at) = :search_term", { search_term: "%#{search_term}%" })
  end

end
