class Photo < ApplicationRecord
  belongs_to :source, polymorphic: true
end
