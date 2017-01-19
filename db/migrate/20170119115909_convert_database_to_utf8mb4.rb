class ConvertDatabaseToUtf8mb4 < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER TABLE `[messages]` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin, MODIFY [message_text] VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end
end
