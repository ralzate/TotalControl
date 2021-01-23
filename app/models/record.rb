class Record < ApplicationRecord
  belongs_to :person
  
  def self.search_by(search_term)
    where("Date(created_at) = :search_term", { search_term: "%#{search_term}%" })
  end

end
