require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,last_name,first_name,lname_reading,fname_reading,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数どちらも含めてあれば登録できる' do
        @user.password ='2021te'
        @user.password_confirmation = '2021te'
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
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation =''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 't0000'
        @user.password_confirmation = 't0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'techca'
        @user.password_confirmation = 'techca'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input both half-width alphanumeric characters with 6 characters or more.")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input both half-width alphanumeric characters with 6 characters or more.")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'てっくきゃん'
        @user.password_confirmation = 'てっくきゃん'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input both half-width alphanumeric characters with 6 characters or more.")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'lname_readingが空では登録できない' do
        @user.lname_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lname reading can't be blank"
      end
      it 'fname_readingが空では登録できない' do
        @user.fname_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Fname reading can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'ｸﾛﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it 'lname_readingがカタカナ以外では登録できない' do
        @user.lname_reading = 'くろだ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lname reading is invalid. Input full-width katakana characters."
      end
      it 'fname_readingがカタカナでは登録できない' do
        @user.fname_reading = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include "Fname reading is invalid. Input full-width katakana characters."
      end
    end
  end
end
