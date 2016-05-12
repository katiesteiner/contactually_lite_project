class Contact < ActiveRecord::Base

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, length: { maximum: 80 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true
  validates :company_name, presence: true, length: { maximum: 40 }

  require 'csv'

  def self.import(file)
    data = CSV.table(file.path, headers: false, col_sep: ' ') 
    data[1..-1].each do |row|
      contact = Contact.new(
          first_name: row[0],
          last_name: row[1],
          email_address: row[2],
          phone_number: row[3],
          company_name: row[4]
        )
      contact.save!
      end
    end

    def normalize_phone_number(number)
      
    end

end