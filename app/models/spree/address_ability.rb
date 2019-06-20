# frozen_string_literal: true

class Spree::AddressAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, Spree::Address do |address|
      address.user == user
    end

    can :create, Spree::Address do |_address|
      user.id.present?
    end
  end
end
