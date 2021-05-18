require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user, item_id: item)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'user_idとitem_id,token,postal_code,prefecture_id,city,house_number,building_name,phone_numberが存在すれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
      it 'phone_numberが1以上99999999999以下であれば購入できる' do
        @order_delivery.phone_number = 99999999999
        expect(@order_delivery).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'user_idが空では登録できない' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では登録できない' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空では購入できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが「-」を含めないと購入できない' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが「---」では購入できない' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空では購入できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空では購入できない' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_delivery.phone_number = 100000000000
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number is invalid.Only numbers within 11 digits can be saved"
      end
      it 'phone_numberが全角では購入できない' do
        @order_delivery.phone_number = '０９０５５５５６６３３'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number is invalid.Only numbers within 11 digits can be saved"
      end
      it 'phone_numberが半角英数混合では購入できない' do
        @order_delivery.phone_number = '1kk9'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number is invalid.Only numbers within 11 digits can be saved"
      end
    end
  end
end