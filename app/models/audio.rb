class Audio < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_attached_file :sound
  validates_attachment_content_type :sound, :content_type => /.*/
end
