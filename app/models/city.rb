class City < ApplicationRecord
  has_many :streets
  belongs_to :country
  accepts_nested_attributes_for :country
end
