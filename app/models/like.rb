class Like < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :user
end
