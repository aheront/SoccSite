class AddAttachmentSoundToAudios < ActiveRecord::Migration[5.0]
  def self.up
    change_table :audios do |t|
      t.attachment :sound
    end
  end

  def self.down
    remove_attachment :audios, :sound
  end
end
