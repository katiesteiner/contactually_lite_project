class AddToContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.attachment :tsv
      t.attachment :csv
    end
  end

  def self.down
    remove_attachment :contacts, :tsv, :csv
  end
end
