# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  value         :integer
#  votable_type :string
#  votable_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ApplicationRecord
  validates :value, presence: true
  validate :value, :vote_counts_for_one_point

  belongs_to :votable, polymorphic: true

  def vote_counts_for_one_point
    unless (self.value == -1 || self.value == 1)
      errors.add(:value, 'value can only be 1 or -1')
    end
  end

end
