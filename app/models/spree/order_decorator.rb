# frozen_string_literal: true

module OrderDecorator
  extend ActiveSupport::Concern

  included do
    prepend(InstanceMethods)
    before_validation :clone_shipping_address
  end

  module InstanceMethods
    def clone_shipping_address
      return unless SolidusAddressBook::Config[:disable_bill_address]

      bill_address = ship_address if ship_address

      true
    end

    def clone_billing_address
      if bill_address
        ship_address = bill_address
      end
      true
    end

    def bill_address_id=(id)
      address = Spree::Address.where(id: id).first

      if address && address.user_id == user_id
        self["bill_address_id"] = address.id
        user.update_attribute(:bill_address_id, address.id)
        bill_address.reload
      else
        self["bill_address_id"] = nil
      end
    end

    def bill_address_attributes=(attributes)
      bill_address = update_or_create_address(attributes)
      user.bill_address = bill_address if user
    end

    def ship_address_id=(id)
      address = Spree::Address.where(id: id).first

      if address && address.user_id == user_id
        self["ship_address_id"] = address.id
        user.update_attribute(:ship_address_id, address.id)
        ship_address.reload
      else
        self["ship_address_id"] = nil
      end
    end

    def ship_address_attributes=(attributes)
      ship_address = update_or_create_address(attributes)
      user.ship_address = ship_address if user
    end

    def assign_default_addresses!
      if user
        bill_address = user.bill_address if !bill_address_id && user.bill_address.try(:valid?)
        # Skip setting ship address if order doesn't have a delivery checkout step
        # to avoid triggering validations on shipping address
        ship_address = user.ship_address if !ship_address_id && user.ship_address.try(:valid?) && checkout_steps.include?("delivery")
      end
    end

    private

    def update_addresses_params
      bill_address_attributes = @updating_params["order"].delete("bill_address_attributes")
      bill_address_id = @updating_params["order"].delete("bill_address_id")
      ship_address_attributes = @updating_params["order"].delete("ship_address_attributes")
      ship_address_id = @updating_params["order"].delete("ship_address_id")
    end

    def update_or_create_address(attributes = {})
      return if attributes.blank?

      if user
        address = user.addresses.build(attributes.except(:id)).check
        return address if address.id
      end

      if attributes[:id]
        address = Spree::Address.find(attributes[:id])
        attributes.delete(:id)

        if address&.editable?
          address.update_attributes(attributes)
          return address
        else
          attributes.delete(:id)
        end
      end

      if !attributes[:id]
        address = Spree::Address.new(attributes)
        address.save
      end

      address
    end
  end
end

Spree::Order.include(OrderDecorator)
