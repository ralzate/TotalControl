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
  belongs_to :user
  has_many :records



  accepts_nested_attributes_for :records, allow_destroy: true, reject_if: :all_blank


  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :identification, presence: true
  
  
  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (lastname) LIKE :search_term OR
            (email) LIKE :search_term OR (company) LIKE :search_term OR
            (address) LIKE :search_term OR (identification)  LIKE :search_term ",{ search_term: "%#{search_term}%" }])
  end
end
