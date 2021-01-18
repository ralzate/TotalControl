class User < ApplicationRecord
  has_many :registries

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable  

  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (email)   LIKE :search_term",
    {search_term: "%#{search_term}%"}])
  end

end
