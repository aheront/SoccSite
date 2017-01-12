class Photo < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :users
end
