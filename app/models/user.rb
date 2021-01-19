class User < ApplicationRecord
  has_many :registries
  accepts_nested_attributes_for :registries, allow_destroy: true, reject_if: :all_blank

  devise :database_authenticatable, :registerable, :recoverable, :rememberable  

  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (email)   LIKE :search_term",
    { search_term: "%#{search_term}%" }])
  end

end
