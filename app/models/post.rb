class Post < ApplicationRecord
  belongs_to :source, polymorphic: true
end
