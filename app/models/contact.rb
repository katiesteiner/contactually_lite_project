class Contact < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email_address, :phone_number, :company_name

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contact.create! row.to_hash
    end
  end
end
