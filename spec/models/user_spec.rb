require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do

      it "nicknameが空だと登録できない" do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = 'ﾑﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = 'ﾀｲﾁ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaがひらがなと漢字では登録できない" do
        @user.last_name_kana = 'む田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがひらがなと漢字では登録できない" do
        @user.first_name_kana = 'た一'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it "birth_dayが空では登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'user99'
        @user.password_confirmation = 'user100'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは数字と英語を組み合わせないと登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end