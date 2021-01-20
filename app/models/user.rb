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
  has_many :records
  has_many :people

  devise :database_authenticatable, :registerable, :recoverable, :rememberable  

  def self.search_by(search_term)
    where(["(name) LIKE :search_term OR (email)   LIKE :search_term",
    { search_term: "%#{search_term}%" }])
  end

end
