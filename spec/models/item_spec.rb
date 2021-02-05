require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができるとき' do
      it '商品の写真、名前、説明、カテゴリー情報、状態、配送労の負担、発送元地域、発送までの日数、販売価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it '商品の写真がない場合出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '名前が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリー情報が空では出品できない' do
        @item.kategory_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Kategory is not a number'
      end

      it '状態が空では出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'State is not a number'
      end

      it '配送料の負担が空では出品できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden is not a number'
      end

      it '発送元地域何からでは出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area is not a number'
      end

      it '発送までの日数が空では出品できない' do
        @item.sipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sipping is not a number'
      end

      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'userが紐づいてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
