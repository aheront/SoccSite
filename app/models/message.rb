class Message < ApplicationRecord
  belongs_to :user
  has_many :photos, as: :source
  validates_presence_of :message_text
  validates_presence_of :user_id
end
