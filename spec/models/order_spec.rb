require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
  end

  describe '発送先の入力項目' do
    context '発送できるとき' do
      it '郵便番号、都道府県、市区町村、番地、電話番号、tokenがあれば発送できる' do
        expect(@order).to be_valid
      end

      it '番地が空でも発送できる' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end
    context '発送できないとき' do
      it '郵便番号が空では発送できない' do
        @order.postalc = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postalc can't be blank"
      end

      it '郵便番号は7桁以内出ないと発送できない' do
        @order.postalc = 12_345_678
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postalc is invalid'
      end

      it '郵便番号に-がないと発送できない' do
        @order.postalc = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postalc is invalid'
      end

      it '都道府県が空では発送できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '0以外でないと発送できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include 'Prefecture must be other than 0'
      end

      it '市区町村が空では発送できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipality can't be blank"
      end

      it '番地が空では発送できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end

      it '電話番号が空では発送できない' do
        @order.phonen = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phonen can't be blank"
      end

      it '電話番号は11桁以内出ないと発送できない' do
        @order.phonen = 123_456_789_012
        @order.valid?
        expect(@order.errors.full_messages).to include "Phonen is invalid"
      end

      it '電話番号が英数混合では発送できない' do
        @order.phonen = "a113a5134a"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phonen is invalid"
      end

      it 'tokenが空では発送できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end

      it 'userが紐づいてないと発送できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐づいてないと発送できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
