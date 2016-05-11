class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to root_url, notice: "Contacts uploaded."
  end

  def create
    @contact = Contact.new(contact_params)
  end

  def new
    @contact = Contact.new
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email_address, :phone_number, :company_name)
  end
end
