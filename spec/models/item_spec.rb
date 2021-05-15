require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'nameとitem_explain,category_idとstatus_id,fee_id,prefecture_id,days_id,price,user_id,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上9999999以下であれば登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'item_explainが空では登録できない' do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item explain can't be blank"
      end
      it 'category_idが「---」では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idが「---」では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'fee_idが「---」では登録できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee must be other than 1"
      end
      it 'prefecture_idが「---」では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'days_idが「---」では登録できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Days must be other than 1"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
