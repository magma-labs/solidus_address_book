# frozen_string_literal: true

class AddLabelToAddresses < SolidusSupport::Migration[5.1]
  def change
    add_column :spree_addresses, :label, :string
  end
end
