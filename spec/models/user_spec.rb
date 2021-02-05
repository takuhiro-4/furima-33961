require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、kjname、namekj、knname、namekn、dobが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end

      it 'kjnameとnamekjが全角の漢字であれば登録できる' do
        @user.kjname = '坂田'
        @user.namekj = '坂田'
        expect(@user).to be_valid
      end

      it 'knnameとnameknが全角のカタカナであれば登録できる' do
        @user.knname = 'サカタ'
        @user.namekn = 'サカタ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'kjnameが空では登録できない' do
        @user.kjname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kjname can't be blank"
      end

      it 'namekjが空では登録できない' do
        @user.namekj = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Namekj can't be blank"
      end

      it 'knnameが空では登録できない' do
        @user.knname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Knname can't be blank"
      end

      it 'nameknが空では登録できない' do
        @user.namekn = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Namekn can't be blank"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'kjnameは全角の漢字でないと登録できない' do
        @user.kjname = 'sakata'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kjname is invalid'
      end

      it 'namekjは全角の漢字でないと登録できない' do
        @user.namekj = 'sakata'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Namekj is invalid'
      end

      it 'knnameは全角カタカナでないと登録できない' do
        @user.knname = 'ｻｶﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Knname is invalid'
      end

      it 'knnameは全角カタカナでないと登録できない' do
        @user.namekn = 'ｻｶﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Namekn is invalid'
      end

      it 'dobが空では登録できない' do
        @user.dob = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Dob can't be blank"
      end

      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordは全角では登録できないこと' do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
