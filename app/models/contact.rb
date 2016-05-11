class Contact < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email_address, :phone_number, :company_name, :attachment
  has_attached_file :tsv
  has_attached_file :csv

  do_not_validate_attachment_file_type :tsv
  do_not_validate_attachment_file_type :csv
end