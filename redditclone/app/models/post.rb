# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, :subs, presence: true

  has_many :post_subs
  has_many :comments
  has_many :votes, as: :votable


  has_many :subs,
  through: :post_subs

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User"

  def comments_by_parent_id
    hash = Hash.new {|h,k| h[k]= [] }
    self.comments.each do |comment|
      hash[comment.parent_comment_id] << comment
    end
    hash
  end

end
