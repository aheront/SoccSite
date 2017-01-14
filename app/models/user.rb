class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: [ :male, :female ]
  has_many :photos, as: :source
  has_many :posts, as: :source
  belongs_to :photo
  accepts_nested_attributes_for :photo
  # attr_accessible :photo

  # validates :photo_id, :presence => false
end
