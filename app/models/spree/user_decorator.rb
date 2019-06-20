# frozen_string_literal: true

module UserDecorator
  extend ActiveSupport::Concern

  included do
    has_many :addresses, class_name: 'Spree::Address'
  end
end

Spree.user_class.include(UserDecorator)
