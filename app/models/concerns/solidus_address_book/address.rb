require 'discard'

module SolidusAddressBook
  module Address
    extend ActiveSupport::Concern

    included do
      belongs_to :user, class_name: Spree.user_class.to_s

      include Discard::Model
      self.discard_column = :deleted_at

      scope :with_deleted, -> { where.not(deleted_at: nil) }
    end
  end
end

