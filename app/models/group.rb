class Group < ApplicationRecord
  belongs_to :photo, optional: true
  has_many :users, through: :user_to_groups
  has_many :posts, as: :source,dependent: :destroy
  has_many :photos, as: :source,dependent: :destroy
  accepts_nested_attributes_for :photo
end
