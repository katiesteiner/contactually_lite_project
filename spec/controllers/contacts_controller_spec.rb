require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
let(:contact) { FactoryGirl.create(:contact) }
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new contact' do
        post :create, contact: attributes_for(:contact)
        expect(Contact.count).to eq(1)
      end
    end
  end

  describe 'DESTROY #delete' do
    context 'success' do
      it 'deletes a contact' do
        delete :destroy, id: contact.id, format: :js
        expect(Contact.count).to eq(0)
      end
    end
  end
end