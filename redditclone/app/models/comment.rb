# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  post_id           :integer          not null
#  content           :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord
  validates :author, :content, :post, presence:true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User"

  belongs_to :post

  has_many :votes, as: :voteable

  has_many :child_comments,
  primary_key: :id,
  foreign_key: :parent_comment_id,
  class_name: "Comment"

end
