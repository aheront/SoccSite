class Video < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /.*/
end
