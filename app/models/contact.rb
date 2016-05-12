class Contact < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email_address, :phone_number, :company_name, :attachment

  #validates :first_name, presence: true, length: { maximum: 25 }
  #validates :last_name, presence: true, length: { maximum: 25 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email_address, presence: true, length: { maximum: 80 }, format: { with: VALID_EMAIL_REGEX }
  #validates :phone_number, presence: true
  #validates :company_name, presence: true, length: { maximum: 40 }

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   ((spreadsheet.first_row + 1)..spreadsheet.last_row).each do |i|
  #     contact_hash = Hash[[header, spreadsheet.row(i)].transpose]
  #     contact = Contact.where(id: contact_hash["id"]) || new
  #     contact.create!
  #     contact.count == 1 ? contact.first.update_attributes(contact_hash) : Contact.create!(contact_hash.merge(id: Contact.last.try(:id).to_i + 1))
  #   end
  # end


  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #     when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
  #     when ".xls" then Roo::Excel.new(file.path)
  #     when ".xlsx" then Roo::Excelx.new(file.path)
  #     else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact_hash = row.to_hash
      contact = Contact.where(id: contact_hash["id"])

      if contact.count == 1
        contact.first.update_attributes(contact_hash)
      else
        Contact.create!(contact_hash)
      end
    end
  end

end