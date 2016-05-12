class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contacts were uploaded"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def import
    Contact.import(params[:file])
    redirect_to contacts_path, notice: "Contacts were added."
  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email_address, :phone_number, :company_name)
  end
end
