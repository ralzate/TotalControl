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

require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
