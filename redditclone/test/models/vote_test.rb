# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  vote         :integer
#  votable_type :string
#  votable_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
