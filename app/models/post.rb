class Post < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_many :photos, as: :source
end
