class Post < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_many :photos, as: :source,dependent: :destroy
  has_many :audios, as: :source,dependent: :destroy
  has_many :videos, as: :source,dependent: :destroy
  has_many :likes, as: :source,dependent: :destroy
  validates_presence_of :text,:name
end
