class AddAttachmentFileToVideo < ActiveRecord::Migration[5.0]
  def change
    change_table :videos do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :videos, :file
  end
end
