class Message < ApplicationRecord
  belongs_to :user
  has_many :photos, as: :source
end
