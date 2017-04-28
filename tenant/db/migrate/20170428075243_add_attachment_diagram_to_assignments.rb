class AddAttachmentDiagramToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :diagram
    end
  end

  def self.down
    remove_attachment :assignments, :diagram
  end
end
