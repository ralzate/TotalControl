class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

    def self.search_by(search_term)
    where(["(name)    LIKE :search_term OR 
            (email)   LIKE :search_term", 
      {search_term: "%#{search_term}%"}])
    end

end
