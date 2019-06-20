module SolidusAddressBook
  module PermittedAttributesConcern
    def address_attributes
      super | [:label]
    end

    def checkout_attributes
      super | [:bill_address_id, :ship_address_id]
    end
  end
end
