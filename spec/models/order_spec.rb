# require 'rails_helper'

# RSpec.describe Order, type: :model do
#   before do
#     @order = FactoryBot.build(:order)
#   end

#   describe '商品購入機能' do
#     context '商品が購入できるとき' do
#       it 'user_idとitem_id,tokenが存在すれば購入できる' do
#         expect(@order).to be_valid
#       end
#     end
#     context '商品が購入できないとき' do
#       it 'user_idが空では登録できない' do
#         @order.user_id = nil
#         @order.valid?
#         expect(@order.errors.full_messages).to include "User must exist"
#       end
#       it 'item_idが空では登録できない' do
#         @order.item_id = nil
#         @order.valid?
#         expect(@order.errors.full_messages).to include "Item must exist"
#       end
#       it 'tokenが空では登録できない' do
#         @order.token = nil
#         @order.valid?
#         expect(@order.errors.full_messages).to include "Token must exist"
#       end
#     end
#   end
# end