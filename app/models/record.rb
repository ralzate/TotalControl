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

  # Imprime en Csv
  require 'csv'
  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
          csv << ['id', 'Persona', 'Temperatura de ingreso', 'Temperatura de salida', 'Creado en', 'Actualizado en'] 
          all.each do |record|
              csv << [record.id, record.person.email, record.entrance_temperature, record.departure_temperature, record.created_at, record.updated_at] 
          end
      end
  end


end
