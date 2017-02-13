class Audio < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_attached_file :sound,dependent: :destroy
  validates_attachment_content_type :sound, :content_type => /.*/
end
