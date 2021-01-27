# == Schema Information
#
# Table name: people
#
#  id             :bigint           not null, primary key
#  name           :string
#  lastname       :string
#  phone          :integer
#  mail           :string
#  address        :string
#  identification :string
#  company        :string
#  user_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Person < ApplicationRecord
  # Relaciones
  belongs_to :user
  has_many :records


  # Nested de registros
  accepts_nested_attributes_for :records, allow_destroy: true, reject_if: :all_blank

  # Validaciones
  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :identification, presence: true
  
  #  Buscador
  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (lastname) LIKE :search_term OR
            (email) LIKE :search_term OR (company) LIKE :search_term OR
            (address) LIKE :search_term OR (identification)  LIKE :search_term ",{ search_term: "%#{search_term}%" }])
  end

  # Imprime en Csv
  require 'csv'
  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
          csv << ['id', 'Nombres', 'Apellidos', 'Telefonos', 
                  'Email', 'Direcciones', 'Identificaciones', 'Empresas',
                  'Usuario que registro', 'Creado en', 'Actualizado en'] 
          all.each do |person|
              csv << [person.id, person.name, person.lastname,  person.phone, 
                      person.email, person.address, person.identification, person.company,        
                      person.user.email, person.created_at, person.updated_at] 
          end
      end
  end

end
