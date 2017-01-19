class UserToGroup < ApplicationRecord
  belongs_to :groups, index: true
  belongs_to :user, index: true
end
