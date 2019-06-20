# frozen_string_literal: true

require 'spec_helper'

describe Spree::AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:address) { create(:address, user: user) }
  let(:order_address) { create(:address, user: user) }
  let!(:order) do
    create(:shipped_order,
           ship_address_id: order_address.id,
           bill_address_id: order_address.id,
           user: user)
  end

  before do
    allow(controller).to receive_messages(try_spree_current_user: user)
  end

  context '#update' do
    context 'editable? as true' do
      it 'updates editable address' do
        put :update, params: {
                                id: address.id,
                                address: {
                                  address1: 'Test Street #1'
                                }
                              }
        expect(response.status).to eq(302)
      end
    end

    context 'editable? as false' do
      it 'clones the original address and use it on the order' do
        put :update, params: {
                                id: order.bill_address.id,
                                address: {
                                  address1: 'Test Street #1'
                                }
                              }

        expect(response.status).to eq(302)
        expect(order_address.reload.deleted_at).not_to be_nil
        expect(order.reload.bill_address.id).to eq(order_address.id)
      end
    end
  end

  context '#destroy' do
    context 'can_be_deleted? as true' do
      it 'deletes address' do
        delete :destroy, params: { id: address.id }
        expect(response.status).to eq(302)
        expect(user.addresses).not_to include(address)
        expect(Spree::Address.with_deleted).not_to include(address)
      end
    end

    context 'can_be_deleted? as false' do
      it "doesn't delete the address" do
        delete :destroy, params: { id: order.bill_address.id }

        expect(response.status).to eq(302)
        expect(order.reload.bill_address.deleted_at).not_to be_nil
        expect(Spree::Address.with_deleted).to include(order.bill_address)
      end
    end
  end
end
