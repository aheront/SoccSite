class Message < ApplicationRecord
  belongs_to :user
  has_many :photos, as: :source
  validates_presence_of :message_text,:user_id
end
