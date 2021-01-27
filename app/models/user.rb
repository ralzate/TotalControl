# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  user_role              :integer
#

class User < ApplicationRecord
  # Relaciones
  has_many :people

  # Seguridad de devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validaciones
  validates_presence_of :name
  validates_format_of :email,:with => Devise::email_regexp
  validates :password, 
            presence: true, 
            length: {  minimum: 8, maximum: 20 }
  validates :password_confirmation, 
            presence: true, 
            length: {  minimum: 8, maximum: 20 }
  validates_presence_of :user_role


  # Buscador
  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (email)   LIKE :search_term",
    { search_term: "%#{search_term}%" }])
  end

  # Imprime en Csv
  require 'csv'
  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
          csv << ['id', 'Nombres', 'Emails', 'Rol', 'Creado en', 'Actualizado en'] 
          all.each do |user|
              csv << [user.id, user.name, user.email,  user.user_role, user.created_at, user.updated_at] 
          end
      end
  end


end
