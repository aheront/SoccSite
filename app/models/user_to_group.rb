class UserToGroup < ApplicationRecord
  belongs_to :groups
  belongs_to :user
end
