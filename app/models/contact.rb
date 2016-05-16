class Contact < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    file = File.open(file.path, 'r')
    index = 0
    file.each_line do |line|
      if index > 0
        row = CSV.parse_line(line, col_sep: "\t")
        contact = Contact.new(
          first_name: row[0],
          last_name: row[1],
          email_address: row[2],
          phone_number: self.normalize_phone_number(row[3]),
          company_name: row[4]
        )
        contact.save!
      end
      index += 1
    end
  end

  def self.normalize_phone_number(number)
    number.tr!(')', '-')
    number.tr!('(', '')
    number.tr!('.', '-')
    if number[0] + number[1] == '1-'
      number[0] = ''
      number[0] = ''
    end
    number
  end
end
