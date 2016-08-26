class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :joined_members, through: :members, source: :user, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
end
