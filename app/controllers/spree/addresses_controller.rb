# frozen_string_literal: true

module Spree
  class AddressesController < Spree::StoreController
    helper Spree::AddressesHelper
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    load_and_authorize_resource class: Spree::Address

    before_action :load_address, only: [:update, :destroy]
    before_action :set_return_path, only: :edit

    def new
      @address = Spree::Address.default
    end

    def create
      @address = try_spree_current_user.addresses.build(address_params)

      if @address.save
        flash[:notice] = t('spree.successfully_created')
        redirect_to account_path
      else
        flash[:error] = @address.errors.full_messages.join(', ')
        render action: 'new'
      end
    end

    def update
      @address.editable? ? update_address : clone_address
    end

    def destroy
      if @address.destroy
        flash[:notice] = t('spree.successfully_removed')
        redirect_to request.env['HTTP_REFERER'] || account_path
      else
        flash[:error] = t('spree.unsuccessfully_removed')
        redirect_to :back
      end
    end

    private

    def address_params
      params.require(:address).permit(:label, :address, :firstname, :lastname,
                                      :address1, :address2, :city, :state_id, :zipcode,
                                      :country_id, :phone, :user_id)
    end

    def load_address
      @address ||= Spree::Address.find(id: params[:id])
    end

    def set_return_path
      session['spree_user_return_to'] = request.env['HTTP_REFERER']
    end

    def update_address
      if @address.update_attributes(address_params)
        flash[:notice] = t('spree.successfully_updated')
        redirect_back_or_default(account_path)
      else
        render action: 'edit'
      end
    end

    def clone_address
      address = @address
      new_address = Spree::Address.new(address.attributes.except('id',
                                                                 'created_at',
                                                                 'updated_at',
                                                                 'deleted_at'))
      new_address.assign_attributes(address_params)
      address.destroy

      if @address = new_address.save
        flash[:notice] = t('spree.successfully_updated')
        redirect_back_or_default(account_path)
      else
        render action: 'edit'
      end
    end
  end
end
