class AddToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :tsv, :attachment
    add_column :contacts, :csv, :attachment
  end
end
