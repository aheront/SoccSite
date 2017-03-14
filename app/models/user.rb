class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: [ :male, :female ]
  has_many :photos, as: :source,dependent: :destroy
  has_many :audios, as: :source,dependent: :destroy
  has_many :videos, as: :source,dependent: :destroy
  has_many :posts, as: :source,dependent: :destroy
  belongs_to :photo, optional: true,dependent: :destroy
  accepts_nested_attributes_for :photo
  has_many :messages,dependent: :destroy
  has_many :groups, through: :user_to_groups
  validates :email, uniqueness: true
  has_and_belongs_to_many :dialogs
end
