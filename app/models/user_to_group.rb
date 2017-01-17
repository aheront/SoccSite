class UserToGroup < ApplicationRecord
  t.belongs_to :groups, index: true
  t.belongs_to :user, index: true
end
