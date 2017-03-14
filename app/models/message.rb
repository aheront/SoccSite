class Message < ApplicationRecord
  belongs_to :user
  belongs_to :dialog
  has_many :photos, as: :source
  validates_presence_of :message_text
end
