class FriendsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :friends_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend, index: true
    end
  end
end

