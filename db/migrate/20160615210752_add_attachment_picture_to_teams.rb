class AddAttachmentPictureToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :teams, :picture
  end
end
